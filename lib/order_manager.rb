class OrderManager

  attr_reader :restaurants, :menu, :order

  def initialize
    @restaurants = Restaurants.new
    get_restaurants(restaurants)
  end

  def new_order(menu_name, *items, total)
    @menu = @restaurants.search_for(menu_name)

    @order = Order.new(@menu)
    (0..items.length - 1).step(2).each do |index|
      name = items[index]
      quantity = items[index + 1]
      @order.add_item(items[index], items[index + 1])
    end

    finalize_order(total)
  end

  def finalize_order(total)
    @order.confirm_order(total)
  end

  def get_restaurants(restaurants)
    restaurants.load_restaurants
    restaurants.find_restaurants
  end
end
