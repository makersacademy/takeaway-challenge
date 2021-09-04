require_relative 'menu'
require_relative 'dish'

class Order
  attr_reader :order_list

  def initialize
    @order_list = []
  end

  def add(name, amount)
    fail "Couldn't find this dish. Check your spelling." if Menu::MENU.select { |dish| dish[:name] == name }.empty?
    
    dish = Menu::MENU.select { |dish| dish[:name] == name }.inject(:merge)
    amount.times { @order_list << Dish.new(name, dish.fetch(:price)) }
  end

  def total
    @order_list.map { |dish| dish.price }.sum
  end
end
