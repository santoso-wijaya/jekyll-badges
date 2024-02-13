# frozen_string_literal: true

require 'date'

module Jekyll
  module Badges

    Badge = Data.define(
        :id,
        :title,
        :description,
        :image_url,
        :created,
        :granted,
        :show) do

      def initialize(
          id:,
          title:,
          description: nil,
          image_url: '',
          created: nil,
          granted: nil,
          show: false)
        super(
            id:,
            title:,
            description:,
            image_url:,
            created: created || Date.today,
            granted:,
            show:)
      end

      def <=>(other)
        return unless other.is_a?(self.class)
        created <=> other.created
      end

      include Comparable

      def to_h
        super.to_h { |name, val| [name.to_s, val] }
      end
    end

  end
end
