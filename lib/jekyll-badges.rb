require 'jekyll'

require 'jekyll-badges/tag'


# See: https://github.com/Shopify/liquid/wiki/Liquid-for-Programmers#create-your-own-tags
Liquid::Template.register_tag('badges', Jekyll::Badges::Tag)
