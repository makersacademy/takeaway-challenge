# understands how to display a menu
require_relative 'dish'
require_relative 'order'

class Menu
  attr_reader :dish, :dishes, :name, :price, :quantity, :order
  attr_accessor :total

  def initialize(order_class = Order)
    @dishes = []
    @order_class = order_class
    @total = 0
  end

  def add_dish(dish)
    @dish = dish
    @dishes << dish
  end

  def display
    @dishes.each_with_index do |dish, index|
      index += 1
      puts "#{index}: #{dish}"
    end
  end

  def choose(selected, quantity)
    total = 0
    @order = @order_class.new
    @dishes.each_with_index do |dish, index|
      # puts total += total === 0!
      index += 1
      @order.add_to_order(dish, quantity) if index == selected
    end

  end
end
