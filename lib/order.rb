require_relative 'menu'
class Order

  attr_reader :items
  
  def initialize
    @items = []
  end

  def total
    items.inject(0) { |sum, dish| sum + dish.price }
  end

end
