require_relative 'order'

class TakeAway
  attr_reader :order
  def initialize(menu, order = nil)
    @menu = menu
    @order = order || Order.new(menu)
  end

  def show_menu
    @menu.list_dishes
  end
  
  def select_(dishes)
    dishes.each do |dish_name, quantity|
      @order.user_choice(dish_name.capitalize,quantity)
    end
  end
end