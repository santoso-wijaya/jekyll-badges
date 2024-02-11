# frozen_string_literal: true

module JekyllBadges

  Badge = Data.define(
      :id,
      :title,
      :description,
      :image_url,
      :created,
      :granted,
      :show) do
    def <=>(other)
      return unless other.is_a?(self.class)
      granted <=> other.granted
    end

    include Comparable
  end

end
