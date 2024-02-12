# frozen_string_literal: true

require 'date'
require 'jekyll'

require_relative 'badge.rb'

module JekyllBadges
  # See: https://jekyllrb.com/docs/plugins/tags/
  class BadgesEmbed < Liquid::Tag

    def initialize(tag_name, content, tokens)
      super
      @content = content # TODO: add options handling here
    end

    # See: https://github.com/Shopify/liquid/wiki/Liquid-for-Programmers#rendering
    def render(context)
      @context = context

      if disabled_in_development?
        Jekyll.logger.info "Jekyll Badges:", "Skipping badges generation in development"
        return ""
      end

      # TODO: Make sure badge IDs are all unique.
      badges = site.data['badges'].map { |badge_data| 
        Badge.new(**normalize_badge_params(badge_data))
      }.filter { |badge|
        badge.show and (not badge.granted.nil?) and (badge.granted <= TODAY)
      }
      .sort
      .reverse

      puts badges.inspect # TODO: debug only; remove

      # get the template
      badges_template_partial = File.read(badges_template)
      badges_template_parsed = Liquid::Template.parse(badges_template_partial)

      puts badges_template_parsed.inspect # TODO: debug only; remove
      
      return badges_template_parsed.render(context)
    end

    # See: https://github.com/Shopify/liquid/wiki/Liquid-for-Programmers#create-your-own-tags
    Liquid::Template.register_tag "badges", self

    private

    TODAY = Date.today

    def site
      @site ||= @context.registers[:site]
    end

    # Returns the plugin's config or an empty hash if not set
    def config
      @config ||= site.config["badges"] || {}
    end

    def badges_template
      return site.in_source_dir(config['template'])
    end

    def disabled_in_development?
      config && config["disable_in_development"] && Jekyll.env == "development"
    end

    def normalize_badge_params(badge_data)
      # Make sure `badge_data['image_url']` is valid and the asset exists
      # TODO

      badge_data['created'] = Date.parse(badge_data['created']) unless badge_data['created'].nil?
      badge_data['granted'] = Date.parse(badge_data['granted']) unless badge_data['granted'].nil?

      return badge_data.transform_keys(&:to_sym)
    end

  end # class BadgesEmbed
end # module JekyllBadges
