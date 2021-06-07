require_relative './menu.rb'
require_relative './order.rb'

class Takeaway
  attr_reader :menu, :order

  def initialize(menu)
    @menu = Menu.new(menu)
  end

  def show_menu
    @menu.show_menu
  end

  def place_order(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end
end