require_relative './restaurant.rb'

class Order

  attr_reader :menu, :selection, :provided_total

  def initialize(restaurant = Restaurant.new)
    @menu = restaurant.menu
  end

  def select_menu_items(selection, provided_total)
    @provided_total = provided_total
    @selection = selection
  end

  def validate_order
    raise "Incorrect total provided" unless calculated_total == @provided_total
    @provided_total
  end

  private

  def calculated_total
    @selection.map { |item, amount| amount * menu[item] }.inject(&:+)
  end

end
