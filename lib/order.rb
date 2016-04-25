require_relative 'pizza'

class Order

  def initialize restaurant = Pizza.new
    @restaurant = restaurant
    # @log = restaurant.log
  end

  def listing
    @restaurant.list
  end

  def name
    @restaurant.name
  end

  def review
    @restaurant.log
  end

  def clear_log
    @restaurant.clear_log
  end

  def place_order
    @restaurant.new_order
  end

  def check_out
    @restaurant.check_out
  end
end
