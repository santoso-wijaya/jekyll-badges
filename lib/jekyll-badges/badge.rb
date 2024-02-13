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
        granted <=> other.granted
      end

      include Comparable
    end

  end
end
