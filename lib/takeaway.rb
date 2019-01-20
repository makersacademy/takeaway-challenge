require_relative 'menu'
require_relative 'send_sms'

class Takeaway

  NO_ITEM_MESSAGE = "Item not on menu"
  DELIVERY_MESSAGE = "Thank you! Your order was placed and will be delivered at #{time_delivered}.The total cost is #{total_cost}."
  attr_reader :basket
  def initialize(menu = Menu.new, message = Sendsms.new)
    @menu = menu
    @basket = Hash.new(0)
    @message = message
  end

  def order_food(food, quantity = 1)
    @menu.contains_item?(food) ? add_to_basket(food, quantity) : NO_ITEM_MESSAGE
  end
   
  def menu
    @menu.menu
  end 

  def checkout(value)
    raise "Incorrect total" unless correct_cost?(value)
    @message.send_message(DELIVERY_MESSAGE)
  end

  private

  def add_to_basket(food, quantity)
    @basket[food.to_sym] += quantity
  end

  def correct_cost?(price)
    total_cost == price
  end

  def total_cost
    cost = 0
    @basket.each { |food, quantity| cost += @menu.menu[food] * quantity }
    cost
  end

  def time_delivered
    one_hour = 3600
    now = Time.now + one_hour
    now.strftime('%H:%M') 
  end
end
