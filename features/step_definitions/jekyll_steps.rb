When /^I run Jekyll$/ do
  run_jekyll
end

Given /^I have a badges configuration with "(.+)" set to "(.+)"$/ do |config, value|
  write_file('_config.yml', <<EOF
badges:
  #{config}: #{value}
EOF
  )
end

Given /^I have a badges configuration with:$/ do |config|
  write_file('_config.yml', <<EOF
badges:
  #{config}
EOF
  )
end

Given /^I have a configuration with:$/ do |config|
  write_file('_config.yml', config)
end

Given /^I have no configuration$/ do
  write_file('_config.yml', '')
end

Given /^I have a file "(.+)" with "(.+)"$/ do |path, contents|
  write_file(path, <<EOF
---
---

#{contents}
EOF
  )
end

Given /^I have a _data file "(.+)" with:$/ do |path, contents|
  write_file("_data/#{path}", contents)
end

Then /^there should be no errors$/ do
  # Implicit pass
end

Then /^I should see "(.+)" in "(.*)"$/ do |text, file|
  contents = File.open(file).readlines.join
  assert contents.inspect.include?(text), "Expected to find #{text.inspect} in #{contents.inspect}"
end

Then /^I shouldn't see "(.+)" in "(.*)"$/ do |text, file|
  contents = File.open(file).readlines.join
  assert !contents.inspect.include?(text), "Expected to find #{text.inspect} in #{contents.inspect}"
end
