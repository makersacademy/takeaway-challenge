
class Order
  attr_reader :order

  def initialize
    @order = []
  end

  def add(menu, dishes)
    dishes.each do |dish|
      @order << menu[dish - 1]
    end
  end
end
