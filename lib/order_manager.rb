class OrderManager

  attr_reader :restaurants, :menu, :order

  def initialize(order_class = Order)
    @restaurants = Restaurants.new
    get_restaurants(restaurants)
    @order_class = order_class
  end

  def new_order(menu_name, *items, total)
    load_menu(menu_name)
    create_order
    add_items(items)
    finalize_order(total)
  end

  def add_items(items)
    (0..items.length - 1).step(2).each do |index|
      name = items[index]
      quantity = items[index + 1]
      @order.add_item(items[index], items[index + 1])
    end
  end

  def create_order
    @order = @order_class.new(@menu)
  end

  def load_menu(menu_name)
    @menu = @restaurants.search_for(menu_name)
  end

  def finalize_order(total)
    @order.confirm_order(total)
  end

  def get_restaurants(restaurants)
    restaurants.load_restaurants
    restaurants.find_restaurants
  end
end
