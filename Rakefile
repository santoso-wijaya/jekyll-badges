require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'jekyll-badges/version'

require 'rake'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features)

task :default => [:features]

task :release do |t|
  system "gem build jekyll-badges.gemspec"
  # TODO: Uncomment the lines below when we're ready to release.
  # system "git tag v#{Jekyll::Badges::VERSION} -a -m 'Tagged release of jekyll-badges-#{Jekyll::Badges::VERSION}.gem'"
  # system "git push --tags"
  # system "gem push jekyll-badges-#{Jekyll::Badges::VERSION}.gem"
end