class Order

  attr_reader :order

  def initialize
    @order = {}
  end

  def add_to_order(dish, quantity)
    if @order.keys.include?(dish.to_sym)
      @order[dish.to_sym] = @order[dish.to_sym] + quantity
    else
      @order[dish.to_sym] = quantity
    end
    return "#{dish.capitalize} x#{quantity}"
  end

end
