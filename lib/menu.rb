class Menu

  attr_reader :dishes, :order

  def initialize(dish_hash, order_class = Order)
    @dishes = dish_hash
    @order = order_class
  end

  def printing_menu
    dishes.map do |name, price|
      "#{name.to_s.capitalize} #{format("%.2f", price)}"
    end.join(", ")
  end

  def place_order(dishes)
    dishes.map do |dish, quantity|
      order.add(dish, quantity)
    end
  end

end
