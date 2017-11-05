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

  def get_restaurant(name)
    @restaurants.select { |restaurant| restaurant.name == name }[0]
  end

end
