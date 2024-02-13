require 'liquid/drop'

module Jekyll
  module Badges
    class BadgesDrop < Liquid::Drop

      def initialize(badges)
        @badges = badges.sort.reverse
        # TODO: Make sure badge IDs are all unique.
      end

      def visible_badges
        @badges.filter { |badge| badge.show }
               .map { |badge| badge.to_h { |name, val| [name.to_s, val] } }
      end

    end
  end
end