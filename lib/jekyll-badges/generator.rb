# frozen_string_literal: true

require 'date'
require_relative 'badge.rb'

module JekyllBadges
  class Generator < Jekyll::Generator
    priority :lowest

    @@today = Date.today

    # Main plugin action, called by Jekyll-core
    def generate(site)
      badges = site.data['badges'].map { |badge_data| 
        Badge.new(**normalize_badge_params(badge_data))
      }.filter { |badge| badge.show & (badge.granted <= @@today) }
      .sort
      .reverse

      puts badges.inspect
    end # def generate

    private

    def normalize_badge_params(badge_data)
      # Make sure all fields are there; or else provide default values
      # TODO

      # Make sure `badge_data['image_url']` is valid and the asset exists
      # TODO

      badge_data['created'] = Date.parse(badge_data['created'])
      badge_data['granted'] = Date.parse(badge_data['granted'])

      return badge_data.transform_keys(&:to_sym)
    end

  end # class Generator
end # module JekyllBadges
