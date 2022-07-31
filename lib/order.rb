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

  def print_order
    dishes = []
    @order_list.each { |dish| dishes << dish.name }
    dishes.uniq.map { |dish| "#{dishes.count(dish)} X #{dish}"}.reduce(&:merge)
  end

  def total
    @order_list.map { |dish| dish.price }.reduce(0, :+)
  end
end

# a = Order.new
# a.add_order('Lasagna', 2)
# a.add_order('Pizza Vesuvio', 3)
#  a.print_order