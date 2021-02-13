require_relative 'order'

class Dishes
  attr_reader :dishes_list
  def initialize
    @dishes_list = [
      { item: 'Marinara', price: 7.50 },
      { item: 'Margherita', price: 8.95 },
      { item: 'Bufala DOP', price: 11.25 },
      { item: 'Nduja', price: 11.50 },
      { item: 'Double Pepperoni & Spicy Honey', price: 12.95 },
      { item: 'Mushroom & Truffle', price: 11.95 },
      { item: 'The 8-Cheeses Pizza', price: 11.50 },
    ]
  end

  def browse
    @dishes_list.each_with_index { |dish, index| puts "Item #{index+1} - #{dish[:item]} £#{dish[:price]}" }
  end

  def start_order
    @my_order = Order.new
  end

end
