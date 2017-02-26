# Shows list of menu items that user cannot edit - done

require_relative 'restaurant'

class Menu

  def initialize(restaurant = Restaurant.new)
    @restaurant = restaurant
  end

  def view
  puts @restaurant.menu # format nicer later
  end

  # def select(food)
  #     @restaurant.menu.select do |item|
  #     item[:food] == food
  #   end
  # end
  #
  # def selection(food, amount)
  #   # order = amount.times.collect do
  #     order = self.select(food)
  #   # end
  #   @order << order * amount
  #   @order.flatten!
  # end


end
