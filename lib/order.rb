require_relative './takeaway'

class Order < Takeaway

  attr_reader :order_items

  def initialize()
    @order_items = []
    @menu_items = menu_items
    @current_total
  end

  def add(dish, amount)
    @order_items << {:item => dish, :amount => amount}
  end

  # def check_total
  #   @current_total = @order_items
  # end
end
