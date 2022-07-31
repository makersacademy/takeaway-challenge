class Takeaway
  attr_reader :menu, :order

  def initialize(order: nil)
    @menu = {ramen: 5.60, chicken: 4.20, salad: 3.99}
    @order = order
  end

  def list_dishes
    @menu.map do |dish,price|
      "%s: £%.2f" % [dish.to_s.capitalize,price]
    end.join(", ")
  end
  
  def place_order(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end
end