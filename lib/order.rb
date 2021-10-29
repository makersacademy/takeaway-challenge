require_relative 'dish'
require_relative 'menu'

class Order
  attr_reader :order_list, :dish

  def initialize(dish = Dish, menu = Menu)
    @order_list = []
    @dish = dish
    @menu = menu
  end

  def add_order(name, amount)
    dish = Menu::MENU.select { |dish| dish[:name] == name }.reduce(&:merge)
    amount.times { @order_list << @dish.new(name, dish.fetch(:price)) }
  end
end