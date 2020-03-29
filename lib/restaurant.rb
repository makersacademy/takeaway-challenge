require_relative 'order'
class Restaurant
  attr_reader :customer, :todays_menu

  def initialize(basket: Order, available: Menu)
    # this is where we will store the order class and the menu class
    @todays_menu = available.new
    @customer = basket.new(set_menu: available)
  end
end
