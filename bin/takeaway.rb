#! usr/bin/takeaway.rb

require 'dotenv'

require './lib/takeaway'

Dotenv.load

menu_list =
{
  "hawaiian" => 9.99,
  "margherita" => 7.99,
  "vegetarian" => 8.99
}

menu = Menu.new(menu_list)

dishes = {}
loop do
  print "What pizza would you like? When finished with your order type done and hit return"
  dish = gets.strip
  break if dish.downcase = 'done'
  print "How many?"
  quantity = gets.to_i
  dishes[dish] = quantity
end

config =
{
  account_sid: = ENV["ACCOUNT_SID"],
  auth_token: = ENV["AUTH_TOKEN"],
  from: ENV[+441782454810],
  to: ENV[+44702602704],
  BODY: "Thank you! Your order will be delivered before %s"
}
