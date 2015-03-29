require_relative 'menu'
class Order
  attr_reader :total

  def initialize
    @dish_number = input.to_i
  end

  def input input = []
    puts "please select the number of your dish and type'checkout'"
    gets.chomp
  end

  def valid_range? input
    input.to_i.between?(1, 4)
  end

  def cart input, quantity = 1
    @items << { price: price, quantity: quantity }
  end

  def total_price
    items.inject(0) do |result, item|
    result + item[:price].price * item[:quantity]
    end
  end
end
