require_relative "menu"

class Takeaway

  attr_reader :menu, :order

  def initialize(menu)
    @menu = menu
    @order = []
  end

  def place_order(item, quantity)
    @order << [item, quantity]
  end
end
