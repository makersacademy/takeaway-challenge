require_relative "./menu"
require_relative "./text"

class Order
  attr_reader :order

  def initialize(menu = Menu, text = Text)
    @menu = menu.new
    @order = []
    @total = 0
  end

  def view_menu
    @menu.dishes
  end

  def view_order
    "This is your order: #{@order} and the total is: £#{@total}"
  end

  def add food
    fail "This food item is not on the menu!" unless food_included? food
    @menu.dishes.select do |k,v|
      @order << {k => v} if k == food
      total
    end
    @order
  end

  def checkout
  end

  private

  def food_included? food
    @menu.dishes.has_key?(food)
  end

  def total
    @total = order.map{|i| i.values}.flatten.inject(:+)
  end
end
