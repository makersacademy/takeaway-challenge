class OrderManager
  def get_restaurants(restaurants)
    restaurants.load_restaurants
    restaurants.find_restaurants
  end
end
