require_relative 'item'
require_relative 'order'

class Menu
attr_reader :items, :new_order

  def initialize
    @items = {
      "Small Margarita" => 4,
      "Medium Margarita" => 6,
      "Large Margarita" => 8,
      "Small Pepperoni" => 5,
      "Medium Pepperoni" => 7,
      "Large Pepperoni" => 9,
      "Small Vegetarian" => 6,
      "Medium Vegetarian" => 8,
      "Large Vegetarian" => 10
    }
  end

  def list
    @items.each_with_index do |(food, price), index|
        puts "#{index +1}. #{food}: £#{price}\n"
      end
  end

  def order(items)
    @new_order = Order.new(items)
  end

end
