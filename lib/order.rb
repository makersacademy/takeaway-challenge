require_relative 'menu'

class Order

  attr_reader :order, :total

  def initialize
    @order = []
    @total = 0
  end

  def calculate_total
    @order.each do |item|
      @total += item[:price]
    end
    @total
  end

  def add_dish(dish)
    @order << dish
    puts "\nYou added #{dish[:dish]}."
  end

end
