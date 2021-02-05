require './lib/takeaway.rb'

class Basket

  def initialize
    @total = 0
  end

  def price(order)
    order.each { |item| @total += item[:price] }
    @total
  end
end
