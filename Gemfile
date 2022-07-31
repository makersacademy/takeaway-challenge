source "https://rubygems.org"

ruby "3.0.2"

group :text do
  gem "twilio-ruby"
end

group :test do
  gem "rspec"
  gem "simplecov", require: false, group: :test
  gem "simplecov-console", require: false, group: :test
end

group :development, :test do
  gem "rubocop", "1.20"
end
