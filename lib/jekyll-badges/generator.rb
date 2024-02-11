# frozen_string_literal: true

module JekyllBadges
  class Generator < Jekyll::Generator
    priority :lowest

    # Main plugin action, called by Jekyll-core
    def generate(site)
      badges_data = site.data['badges']
      puts badges_data.inspect
      # TODO
    end

    private
    # TODO

  end # class Generator
end # module JekyllBadges
