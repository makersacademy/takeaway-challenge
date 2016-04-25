require 'coveralls'
Coveralls.wear!
require 'capybara/rspec'

RSpec.configure do |config|
  config.before(:all, &:silence_output)
  config.after(:all,  &:enable_output)
end

public
# Redirects stderr and stout to /dev/null.txt
def silence_output
  # Store the original stderr and stdout in order to restore them later
  @original_stderr = $stderr
  @original_stdout = $stdout

  # Redirect stderr and stdout
  $stderr = File.new(File.join(File.dirname(__FILE__), 'output.txt'), 'w')
  $stdout = File.new(File.join(File.dirname(__FILE__), 'output.txt'), 'w')
end

# Replace stderr and stdout so anything else is output correctly
def enable_output
  $stderr = @original_stderr
  $stdout = @original_stdout
  @original_stderr = nil
  @original_stdout = nil
end
