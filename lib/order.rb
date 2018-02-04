require_relative "menu"

class Order

  attr_reader :order

  def initialize(menu = Menu.new)
    @order = Hash.new(0)
    @menu = menu
  end

  def add_to_order(dish, quantity)
    raise "Sorry this dish is not available" unless available?(dish)
    @order[dish] += quantity
  end

  private

  def available?(dish)
    @menu.dishes.has_key?(dish)
  end

end
