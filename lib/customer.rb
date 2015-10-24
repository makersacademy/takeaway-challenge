require_relative 'takeaway'

class Customer

  attr_reader :takeaway, :selections

  def initialize(takeaway_klass)
    @takeaway = takeaway_klass.new
    @selections = Hash.new(0)
  end

  def view_menu
    @takeaway.menu
  end

  def select_dish(dish, quantity)
    order_error(dish)
    @selections[dish] += quantity
  end

  def order_error(dish)
    raise 'Dish unavailable: please select a dish from the menu' unless @takeaway.menu.has_key?(dish)
  end

end
