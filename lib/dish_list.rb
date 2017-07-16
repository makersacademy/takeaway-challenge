require_relative 'dish'

class DishList

  def initialize(dish_class = Dish)
    @list = Array.new
    add(dish_class.new(name: 'Beef Burger', id: :BB, price: 7.5))
    add(dish_class.new(name: 'Nachos',      id: :NC, price: 4.75))
    add(dish_class.new(name: 'Lobster',     id: :LR, price: 19.75))
  end

  def print
    puts "\n\nM E N U\n\n"
    list.each do |n|
      puts "#{n.id} - " + "#{n.name}".ljust(25,'.') + " £#{n.price}"
    end
    puts "\n"
  end

  def data
    list.dup
  end

  private

  attr_accessor :list

  def add(dish)
    list << dish
  end
end
