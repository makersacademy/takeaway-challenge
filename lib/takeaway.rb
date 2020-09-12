require_relative 'restaurant'

class Takeaway
  attr_reader :restaurant

  def initialize(restaurant = Restaurant.new)
    @restaurant = restaurant
    @menu = restaurant.menu
  end

  def view_menu
    puts format_menu.join("\n")
  end

  private

  def format_menu
    @menu.map { |dish| "#{dish.name} - £#{'%.2f' % dish.price}" }
  end
end