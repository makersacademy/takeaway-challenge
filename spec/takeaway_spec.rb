require 'takeaway'

describe Takeaway do

  it "" do

  end

end
=begin
class Takeaway

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def add_to_order(dish)

  end

  def remove_from_order(dish)

  end

  def pay

  end

end

class Menu
  dish_list
  def initialize(dishes = dish_list)
    @dishes = dishes
  end

  def print_dishes
    @dishes.each do |dish|
      "#{dish.name}, #{dish.contents}, #{dish.price}"
    end
  end

  def find(dish)

  end

end

class Dish
  attr_reader :name, :contents, :price

  def initialize(name, contents, price)
    @name = name
    @contents = contents
    @price = price
  end

end

class Order

  def initialize
    @order = []
  end

  def order_total
    total = 0
    @order.each { |dish| total += dish.price }
    total
    @order.map{ |d| d.price }.inject(:+)
  end

  def complete_order

  end

end