require 'order'

class Menu


attr_reader :food, :order

@food = {
  "yum1" => 1,
  "yum2" => 2
}

  def initialize(order_class = Order)
    @order_class = order_class
    @food = food
  end

  def print_food
    food.map do |item, price|
      "#{item} : £#{price}"
    end

    def add(item)
      order = @order_class.new
      order.add(item)
    end



end


end
