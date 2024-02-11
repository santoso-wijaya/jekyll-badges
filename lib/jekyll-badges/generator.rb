# frozen_string_literal: true

require 'date'
require_relative 'badge.rb'

module JekyllBadges
  class Generator < Jekyll::Generator
    priority :lowest

    # Main plugin action, called by Jekyll-core
    def generate(site)
      badges_data = site.data['badges']
      badges_data.each do |badge_data|
        badge = Badge.new(**normalize_badge_params(badge_data))
        puts badge.inspect
      end
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
