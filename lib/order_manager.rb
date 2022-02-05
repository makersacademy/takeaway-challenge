class OrderManager

  attr_reader :order_history, :menu

  # Turn dependancies into a config class perhaps?
  def initialize(menu_file = "", menu_class = Menu, order_class = Order, dish_class = Dish)
    @order_class = order_class
    @menu_class = menu_class
    @dish_class = dish_class
    @order_history = []
    @menu = nil
    initialise_menu(menu_file)
  end

  def generate_order(ordered_dishes)
    return nil if ordered_dishes.empty?
    parsed_order = parse_order(ordered_dishes)
    @order_history << order_dishes(parsed_order)
    @order_history.last
  end

  def initialise_menu(menu_file)
    @menu = @menu_class.new
    @menu.load_menu(menu_file)
  end

  private

  def parse_order(ordered_dishes)
    dishes_hash = ordered_dishes.split(",").each_slice(2).to_a.to_h
    dishes_hash.each { |dish, qty| dishes_hash[dish] = qty.to_i }
  end

  def order_dishes(parsed_order)
    order = @order_class.new
    parsed_order.each do |dish, qty|
      order.order_dish(@menu.select_dish(dish), qty)
    end
    order
  end

end
