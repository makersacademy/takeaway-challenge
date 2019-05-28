#!/usr/bin/env ruby
require 'dotenv/load'
require './lib/menu.rb'
require './lib/order.rb'
require './lib/sms_sender.rb'
require './lib/takeaway.rb'

my_menu = Menu.new
my_menu.load_items('./lib/menus/italian.csv')
my_sms = SmsSender.new
my_takeaway = Takeaway.new(my_menu, Order, my_sms)

puts my_takeaway.start_new_order
puts my_takeaway.order_item('pizza')
puts my_takeaway.order_item('salad')
puts my_takeaway.order_item('bruschetta')
puts my_takeaway.show_total
puts my_takeaway.place_order("£14.50")
