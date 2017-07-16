require_relative 'dish'

class DishList

  def initialize
    @list = Array.new
    add(Dish.new(name: 'Beef Burger', id: 'BB', price: 7.5))
    add(Dish.new(name: 'Nachos',      id: 'NC', price: 4.75))
    add(Dish.new(name: 'Lobster',     id: 'LR', price: 19.75))
  end

  def show
    puts "\n\nM E N U\n\n"
    list.each { |item| puts "#{item.id} - " + "#{item.name}".ljust(25,'.') + " £#{item.price}" }
    puts "\n"
    list.dup
  end

  private

  attr_accessor :list

  def add(dish)
    list << dish
  end
end
