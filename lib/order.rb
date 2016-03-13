require 'pry'
class Order

  attr_reader :menu, :current_order

  def initialize(menu)
    @menu = menu
    @current_order = Hash.new
  end

  def see_menu
    menu.see_dishes
  end

  def place_order(name, quantity)
    @current_order[menu.place_order(name, quantity)]= quantity
    subtotal
  end

  def subtotal
    @sum = 0
    binding.pry
    current_order.each_pair do |dish, quantity|
      @sum += (dish.price)*quantity
    end
    @sum
  end


end