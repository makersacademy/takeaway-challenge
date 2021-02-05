require './lib/takeaway.rb'

class Basket

  def initialize
    @total = 0
  end
  
  def receipt(order)
    order.each { |item| puts "#{item[:name]} - £#{item[:price]}" } 
    puts "Total - £#{price(order)}"
    @total
  end

  private

  def price(order)
    order.each { |item| @total += item[:price] }
    @total
  end
end
