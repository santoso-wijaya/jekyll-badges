# frozen_string_literal: true

require 'date'
require_relative 'badge.rb'

module JekyllBadges
  class Generator < Jekyll::Generator
    priority :lowest

    # Main plugin action, called by Jekyll-core
    def generate(site)
      @site = site

      if disabled_in_development?
        Jekyll.logger.info "Jekyll Badges:", "Skipping badges generation in development"
        return
      end

      badges = site.data['badges'].map { |badge_data| 
        Badge.new(**normalize_badge_params(badge_data))
      }.filter { |badge| badge.show & (badge.granted <= TODAY) }
      .sort
      .reverse

      puts badges.inspect # debug print TODO: remove

      # get the template

    end # def generate

    private

    TODAY = Date.today

    # Returns the plugin's config or an empty hash if not set
    def config
      @config ||= @site.config["badges"] || {}
    end

    def disabled_in_development?
      config && config["disable_in_development"] && Jekyll.env == "development"
    end

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
