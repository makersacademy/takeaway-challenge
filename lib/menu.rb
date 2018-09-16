class Menu

  attr_reader :dishes, :order, :dishq

  def initialize(dish_hash, dishes_quantity, order_class = Order)
    @dishes = dish_hash
    @order = order_class
    @dishq = dishes_quantity
  end

  def printing_menu
    dishes.map do |name, price|
      "#{name.to_s.capitalize} #{format("%.2f", price)}"
    end.join(", ")
  end

  def place_order(dishq)
    dishq.map do |dish, quantity|
      order.add(dish, quantity)
    end
  end

end
