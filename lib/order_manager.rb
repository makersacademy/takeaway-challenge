class OrderManager

  def initialize(menu, order_class = Order)
    @order_class = order_class
    @menu = menu
    @order = nil
  end

  def generate_order(ordered_dishes)
    parsed_order = parse_order(ordered_dishes)
    @order = add_dishes_to_order(parsed_order)
    @order
  end

  # added this for a quick quick test for my feature tests
  def show_order
    @order.show_order
  end

  private

  def parse_order(ordered_dishes)
    dishes_hash = ordered_dishes.split(",").each_slice(2).to_a.to_h
    dishes_hash.each { |dish, qty| dishes_hash[dish] = qty.to_i }
  end

  def add_dishes_to_order(parsed_order)
    order = @order_class.new
    parsed_order.each do |dish, qty|
      order.add_dish(@menu.select_dish(dish), qty)
    end
    order
  end

end