require_relative 'badge.rb'
require_relative 'drop.rb'

module Jekyll
  module Badges
    class Renderer

      def initialize(site)
        @site = site
      end

      def render_badges
        if disabled_in_development?
          Jekyll.logger.info "Jekyll Badges:", "Skipping badges generation in development"
          return ""
        end

        @badges = @site.data['badges'].map { |badge_data| 
          Badge.new(**normalize_badge_params(badge_data))
        }

        # get the template and render it 
        assigns = {
          # Using a Liquid::Drop to organize and query our badges just-in-time.
          # See: https://www.rubydoc.info/gems/liquid/Liquid/Drop
          'badges' => BadgesDrop.new(@badges)
        }
        info = {
          registers: { site: @site }
        }
        badges_template.render(assigns, @site.site_payload, info)
      end

      private

      TODAY = Date.today
      DEFAULT_TEMPLATE_PATH = '_includes/badges.html'

      # Returns the plugin's config or an empty hash if not set
      def config
        @config ||= @site.config["badges"] || {}
      end

      def badges_template
        template_fpath = @site.in_source_dir(config['template'] || DEFAULT_TEMPLATE_PATH)
        partial = File.read(template_fpath)
        Liquid::Template.parse(partial)
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

    end
  end
end