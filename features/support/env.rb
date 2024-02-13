require 'fileutils'
require 'test/unit/assertions'
require 'jekyll-badges'


TEST_DIR = File.join('/', 'tmp', 'jekyll')


def run_jekyll(options = {})
  options = Jekyll.configuration(options)

  site = Jekyll::Site.new(options)
  site.process
end


def write_file(path, contents)
  FileUtils.mkdir_p(File.dirname(path))
  File.open(path, 'w') do |f|
    f.write(contents)
    f.close
  end
end


World(Test::Unit::Assertions)