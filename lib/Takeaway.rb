require_relative 'Order'
require_relative 'Dish'
require_relative 'twilio_parameters'
require 'twilio-ruby'

# twilio_parameters.rb should contain the following:
# $account_sid = "...."
# $auth_token = "...."
# $twilio_num = "+441392..."
# $customer_num = "+447540..."

class Takeaway

  attr_reader :menu

  SET_MENU = [
    { name: "Chicken jalfrezi", price: 8.00 },
    { name: "Lamb bhuna", price: 9.00 },
    { name: "Boiled rice", price: 2.00 },
    { name: "Pilau rice", price: 2.50 },
    { name: "Plain naan", price: 2.50 },
    { name: "Peshwari naan", price: 3.00 },
    { name: "Poppadom", price: 0.50 }
  ]

  def initialize
    @menu = Array.new
    @orders = Array.new
  end

  def add_dish(name, price)
    @menu << Dish.new(name, price)
  end

  def populate_menu(menu = SET_MENU)
    menu.each do |dish|
      add_dish(dish[:name], dish[:price])
    end
  end

  def display_menu
    @menu.each do |dish|
      puts "#{dish.name}: #{currency(dish.price)}"
    end
  end

  def order(received_order)
    new_order = Order.new(received_order, menu)
    @orders << new_order
    msg = order_success_message(new_order)
#    text_message($twilio_num, $customer_num, msg, $account_sid, $auth_token)
  end

  def order_success_message(order)
    time = order.delivery_time.strftime("%k:%M")
    "Thank you! Your order was placed and will be delivered before #{time}"
  end

end

def currency(value, sign = "£")
  "#{sign}#{'%.2f' % value}"
end

def text_message(from, to, text, sid, token)
  @client = Twilio::REST::Client.new(sid, token)
  message = @client.messages.create(body: text, from: from, to: to)
end
