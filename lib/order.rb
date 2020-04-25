class Order
  attr_reader :order_array

  def initialize
    @order_array = []
  end

  def order(order_total, menu, **dish_and_quantity)
    p order_total
    dish_and_quantity.each do |dish, quantity|
      menu.each do |hash|
        if hash.key?(dish)
          quantity.times { @order_array << hash }
        end
      end
    end
    @order_array
  end
end
