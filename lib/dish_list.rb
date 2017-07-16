require_relative 'dish'

class DishList

  def initialize
    @list = Array.new
    add(Dish.new(name: 'Beef Burger', price: 7.5))
    add(Dish.new(name: 'Nachos',      price: 4.75))
    add(Dish.new(name: 'Lobster',     price: 19.75))
  end

  def show
    puts "\n\nM E N U\n\n"
    list.each { |item| puts "#{item.name}".ljust(25,'.') + " £#{item.price}" }
    puts "\n"
    list.dup
  end

  private

  attr_accessor :list

  def add(dish)
    list << dish
  end
end
