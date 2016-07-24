require 'coveralls'
Coveralls.wear!
require 'capybara/rspec'

def ignore_puts
   before do
      $stdout.stub(:write)
   end
end
