require_relative 'menu'

class Order

  attr_reader :current_order, :total_price, :dishes

  def initialize
    @current_order = []
    @total_price = 0
    @menu = Menu.new
  end

  def add_item(dish)
    @current_order << @menu.dishes[dish - 1]
  end

  def order_cost
    @order_total = @current_order.map { |dish| dish[:price]}.inject(:+)
    "Total price: #{@order_total}"
  end


end
