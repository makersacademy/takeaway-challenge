class OrderManager

  attr_reader :restaurants, :menu

  def initialize
    @restaurants = Restaurants.new
    get_restaurants(restaurants)
  end

  def new_order(menu_name, *items, total)
    @menu = @restaurants.search_for(menu_name)
  end

  def get_restaurants(restaurants)
    restaurants.load_restaurants
    restaurants.find_restaurants
  end
end
