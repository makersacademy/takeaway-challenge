source 'https://rubygems.org'

# git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

ruby '3.0.2'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false, group: :test
  gem 'simplecov-console', require: false, group: :test
end

group :development, :test do
  gem 'rubocop', '1.20'
  gem 'twilio-ruby', '~> 5.60.0', '>= 5.60.0'
end
