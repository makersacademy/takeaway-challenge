class Order
  attr_reader :dish, :price, :order

  def initialize
    @order = []
    @price
    @dish
  end

  def add(dish)
    # @dish = dish.name
    @price = dish.price
    @order << {dish: dish.name ,price: dish.price}
  end
#
#   def finish(station)
#     @exit_station = station
#     register({exit_station: @exit_station})
#     log
#     reset
#   end
#
#   def journeys
#     @journeys.dup
#   end
#
#   def log
#     @journeys << @current_journey
#   end
#
#   def reset
#     @current_journey = []
#   end
#
#   def register(station)
#     @current_journey <<  station
#   end
#
# private
#
#   def current_journey
#     @current_journey || self.start(station)
#   end

end
