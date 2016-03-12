require_relative 'takeaway'
require 'dotenv'
Dotenv.load
require 'twilio-ruby'

takeaway = Takeaway.new
p takeaway.menu


p takeaway.select_items({rice:3, pea:5})
p takeaway.place_order({rice:3, pea:5},65)

time = Time.new
p time.hour
p time.min
