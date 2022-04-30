require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start do
  add_filter 'spec'
end

module FormatterOverrides
  def example_pending(_)
  end

  def dump_pending(_)
  end
end

RSpec::Core::Formatters::DocumentationFormatter.prepend FormatterOverrides

require 'text'
require 'takeaway'
require 'menu'
require 'order'