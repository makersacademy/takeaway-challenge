
class Order

  attr_reader :order

  def initialize
    @order = []
  end

  def display
    @order.each{ |a| puts"#{a}" }
  end

end
