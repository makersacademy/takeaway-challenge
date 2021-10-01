class Order

  attr_reader :dishes_ordered, :menu

  def initialize(menu = Menu.new)
    @dishes_ordered = {}
    @menu = menu
    @order_total = 0
  end

  def add_dish_to_order(name, quantity)
    fail 'Unable to place order, the dish is not available' unless menu.dish_available?(name)
    dishes_ordered[name] = quantity
  end

  def calculate_total(menu)
    @dishes_ordered.each do |dish, quantity|
      @order_total += menu.menu_items[dish] * quantity
    end
    @order_total
  end

end
