require './lib/menu.rb'
require './lib/order.rb'

class Takeaway
  attr_reader :dishes, :menu, :order
  def initialize
    @dishes = {
      "marinara" => 5,
      "margherita" => 6,
      "napoli" => 6,
      "calzone" => 8
    }
    @menu = Menu.new
    @order = Order.new
  end

  def visualise_menu
    @menu.show_menu(@dishes)
  end

  def add_to_order(dish, quantity = 1)
    @order.add_dish(dish, quantity)
    "#{dish} X #{quantity} added to your order"
  end
end
