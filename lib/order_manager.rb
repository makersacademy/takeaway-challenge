class OrderManager

  attr_reader :order_history, :menu
  
  # Turn dependancies into a config class
  def initialize(menu_class = Menu, order_class = Order, dish_class = Dish)
    @order_class = order_class
    @menu_class = menu_class
    @dish_class = dish_class
    @order_history = []
    @menu = nil
    initialise_menu
  end

  def generate_order(ordered_dishes)
    return nil if ordered_dishes.empty?
    parsed_order = parse_order(ordered_dishes)
    @order_history << add_dishes_to_order(parsed_order)
    @order_history.last
  end

  def initialise_menu
    # Add support for loading a menu from file.
    # hard coded for time being
    dish_one = @dish_class.new("Curry", 6.5)
    dish_two = @dish_class.new("Spagbol", 7.5)
    dish_three = @dish_class.new("Cottage Pie", 8)
    
    @menu = @menu_class.new([dish_one, dish_two, dish_three])

  end

  private

  def parse_order(ordered_dishes)
    dishes_hash = ordered_dishes.split(",").each_slice(2).to_a.to_h
    dishes_hash.each { |dish, qty| dishes_hash[dish] = qty.to_i }
  end

  def add_dishes_to_order(parsed_order)
    order = @order_class.new
    parsed_order.each do |dish, qty|
      order.order_dish(@menu.select_dish(dish), qty)
    end
    order
  end

end
