# frozen_string_literal: true

require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [SimpleCov::Formatter::Console]
)
SimpleCov.start do
  add_filter '/lib/checks'
  add_filter '/lib/user_interface'
end
