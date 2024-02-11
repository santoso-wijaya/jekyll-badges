# frozen_string_literal: true

require_relative 'badge.rb'

module JekyllBadges
  class Generator < Jekyll::Generator
    priority :lowest

    # Main plugin action, called by Jekyll-core
    def generate(site)
      badges_data = site.data['badges']
      badges_data.each do |badge_data|
        badge = Badge.new(**(badge_data.transform_keys(&:to_sym)))
        puts badge.inspect
      end
      # TODO
    end # def generate
  end # class Generator
end # module JekyllBadges
