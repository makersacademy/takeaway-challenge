require_relative 'menu'

class Order
  attr_reader :current_order
  def initialize
    @current_order = []
    @menu = Menu.new
  end

  def add(dish)
    fail "#{dish} not on menu" if not_on_menu(dish)
    @current_order << dish
  end

  private

  def not_on_menu(dish)
    !@menu.menu.include?(dish.to_sym)
  end
end
