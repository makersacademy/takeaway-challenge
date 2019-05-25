#!/usr/bin/env ruby

require './lib/menu.rb'
require './lib/order.rb'
require './lib/sms_sender.rb'
require './lib/takeaway.rb'

my_menu = Menu.new
my_menu.load_items('./lib/menus/italian.csv')
my_sms = SmsSender.new
my_takeaway = Takeaway.new(my_menu, Order, my_sms)

my_takeaway.start_new_order
my_takeaway.order_item('pizza')
my_takeaway.order_item('salad')
my_takeaway.order_item('bruschetta')
my_takeaway.show_total
my_takeaway.place_order("£14.50")
