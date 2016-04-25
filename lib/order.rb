require_relative 'menu'
require_relative 'dish'
require_relative 'messenger'

class Order
  attr_reader :dishes_ord, :menu, :messenger

  def initialize(menu:, messenger:)
    @dishes_ord = []
    @menu = menu
    @messenger = messenger
  end

  def add(dish, quantity)
    fail 'Dish is not on menu!' unless on_menu?(dish)
    dishes_ord << {dish: dish, quantity: quantity}
  end

  def total_order
    order_sum = 0
    dishes_ord.each do |hash|
      order_sum += hash[:dish].price * hash[:quantity]
    end
    order_sum
  end

  def on_menu?(dish)
   menu.have_dish?(dish)
  end

  def order_verified?(total)
    fail 'Wrong total amount for order' unless total == total_order
    send_message
  end

  private

  def send_message
    @messenger.send
  end
end
