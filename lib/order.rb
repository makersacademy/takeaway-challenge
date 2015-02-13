require_relative 'menu'


require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

class Order

include Menu

attr_accessor :order_list

def initialize
  @order_list = {}
  puts PRICE_LIST
  #request_order --- this breaks the tests due to chomp
end

def item_count
  @order_list.length
end

def select_item(item, quantity)
  @item = item
  @quantity = quantity
  add_items
end

def request_order
  @item = ""
  while @item != "exit"
    request_item
    break if @item == "exit"
    request_quantity  
    add_items
  end
  confirm_order
end

def request_item
  puts "Please select an item from the menu (using the number code). Type 'exit' to finish."
  @item = gets.chomp
end

def request_quantity
  puts "Quantity?"
  @quantity = gets.chomp
end

def add_items
  @order_list[@item] = @quantity
end

def confirm_order
  get_overall_price
  puts "The items ordered are #{@order_list}\n"
  puts "The overall price is #{@overall_price} \n"
  puts "Enter 'yes' if you are happy to proceed"
  answer = gets.chomp
  #downcase
  answer == "yes" ? send_text : return
end

def send_text
  time = Time.new
  time1hr = time + 3600
  puts "Thank you! Your order was placed and will be delivered before #{time1hr.strftime("%I:%M%p")}."

account_sid = 'AC60c54cda75e5c928759e85292d5cd749'
auth_token = 'b6f9be75ac109b8aad8db70d3679272e'
@client = Twilio::REST::Client.new account_sid, auth_token
 
message = @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{time1hr.strftime("%I:%M%p")}.",
    :to => "+447982998xxx",     # Replace with your phone number
    :from => "+441618505718")   # Replace with your Twilio number
puts message.sid
end

def get_overall_price
  get_item_prices
  @overall_price = @unit_prices.inject(0) {|sum, i|  sum + i }
end

def get_item_prices
  @unit_prices = []
  @order_list.each{|item, quantity| @unit_prices << PRICE_LIST[item] * quantity.to_f}
  @unit_prices
end

end