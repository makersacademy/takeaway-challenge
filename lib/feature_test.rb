require_relative 'takeaway'
require_relative 'basket'
require_relative 'menu'
require 'dotenv'
Dotenv.load

tw = Takeaway.new

require_relative 'fake_twilio'

p fake = FakeTwilio.new('123', '123')
p fake.create(from:'from', to: 'to', body: 'body')
