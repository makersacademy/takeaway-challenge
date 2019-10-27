require_relative '../lib/menu'
require_relative '../lib/order'
require_relative '../lib/twilio-send'
require 'date'

def run_program
  setup
  take_order
  check_order
  text_details
end

def setup
  @vn = Menu.new
  @viet = Order.new(@vn)
  @order_list = []
end

def take_order
  puts @vn.list
  while true
    puts "Order by entering the item reference.  If you have finished ordering \
    please enter 000"
    ref = gets.chomp
    break unless ref != "000"
    puts "Please enter the quantity required"
    qty = gets.chomp
    @order_list << { :ref => ref, :quantity => qty }
  end
end

def print_order
  puts @viet.print
end

def check_order

  puts "Enter cost of order"
  input = gets.chomp
  est_cost = input.chomp.to_f
  @viet.check(@order_list, est_cost)
end

def text_details
  puts "Enter your mobile number starting 07. No spaces please."
  phone = gets.chomp
  text_num = "+44" + phone.delete_prefix('0')
  one_hour_ahead = Time.now + 3600
  time_formatted = one_hour_ahead.strftime("%I:%M")
  message = "Thanks for your order. It is being prepared now \
  and will be delivered by #{time_formatted}"
  text_order(text_num, message)
end
