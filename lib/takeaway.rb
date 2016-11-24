require 'twilio-ruby'

class Takeaway

  attr_accessor :menu, :dishes_selected, :total_price, :total_price_array, :dishes_available, :dish_price

  def initialize
    @menu = Hash.new
    @dishes_selected = []
  end

  def menu_update(dish)
    menu["#{dish.name}"] = dish.price.to_s + "£"
  end 

  def order
    puts self.menu
    puts "To begin the selection, press enter. To cancel the action, type 'exit'."
    @total_price_array = []

    while gets.chomp != 'exit' 
      puts "Please choose a dish."
      dish = gets.chomp
      dishes_selected << dish

      puts "Please select the quantity of the dish."
      quantity = gets.chomp

      puts "Please press enter to select another dish or type 'exit'."

      dish_price_calculator(dish, quantity)
    end

    puts "Here is your order."
    puts dishes_selected
    total_price_calculator
  end

  def dish_price_calculator(dish, quantity)
    price = menu["#{dish}"]
    dish_price = price.to_i * quantity.to_i 
    total_price_array << dish_price
  end

  def total_price_calculator
    @total_price = total_price_array.inject {|result, i| result + i}
    p total_price.to_s  + '£'
    raise 'Total price is wrong' if total_price != total_price_array.inject {|result, i| result + i}
  end

  # 'send_reply_message' method not implemented, it should have been part of the 'order' method

  def send_reply_message
  account_sid = ''
  auth_token = ''
  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.messages.create(
  from: '',
  to: '',
  body: 'Your order has been accepted and is already on the way. Thanks for choosing Takeaway.rb.'
)

  end
end