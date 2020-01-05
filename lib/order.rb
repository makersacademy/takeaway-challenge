require_relative 'menu'

class Order
  attr_reader :basket, :total 

  def initialize
    @basket = []
    @total = 0
  end

  def add_item(name, price, quantity) 
    @basket << { name: name, price: price, quantity: quantity }
    @total += price * quantity
  end
  
  def total_cost
    @total
  end

  def view_basket
    @basket.map { |item| 
    puts "#{basket[:quantity]} #{basket[:name]}: #{basket[:price]}"
    puts "Total: #{@total}"}
  end

  
end
