class Takeaway
  attr_reader :restaurants

  def initialize
    @restaurants = []
  end

  def add(restaurant)
    @restaurants.push(restaurant)
  end

  def remove(restaurant)
    @restaurants.delete(restaurant)
  end

  def print_restaurants
    @restaurants.each { |restaurant| puts restaurant.name }
  end

  def print_menu(restaurant)
    raise "This restaurant is not included in our list." unless @restaurants.include?(restaurant)
    restaurant.print_menu
  end

end
