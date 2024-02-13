# frozen_string_literal: true

require 'date'
require 'jekyll'

require_relative 'renderer.rb'

module Jekyll
  module Badges
    # See: https://jekyllrb.com/docs/plugins/tags/
    class Tag < Liquid::Tag

      def initialize(tag_name, content, tokens)
        super
        # TODO: define and handle tag options?
      end

      # See: https://github.com/Shopify/liquid/wiki/Liquid-for-Programmers#rendering
      def render(context)
        Jekyll::Badges::Renderer.new(context.registers[:site]).render_badges
      end

    end
  end
end
