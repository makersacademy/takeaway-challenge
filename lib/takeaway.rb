require_relative 'restaurant'

class Takeaway
  attr_reader :restaurant

  def initialize(restaurant = Restaurant.new)
    @restaurant = restaurant
    @menu = restaurant.menu
  end

  def view_menu
    formatted_menu = @menu.map { |dish| "#{dish.name} - £#{'%.2f' % dish.price}" }
    puts formatted_menu.join("\n")
  end
end