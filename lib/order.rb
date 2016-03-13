require 'pry'
class Order

  attr_reader :menu, :current_order, :summary

  def initialize(menu)
    @menu = menu
    @current_order = Hash.new
    @summary = []
  end

  def see_menu
    menu.see_dishes
  end

  def place_order(name, quantity)
    @current_order[menu.place_order(name, quantity)]= quantity
    subtotal(name, quantity)
  end

  def subtotal(name, quantity)
    @sum = 0
    #binding.pry
    @sum = @current_order.keys.last.price*quantity
    summarize(name, quantity)
    @sum
  end

  def summarize(name, quantity) # when refactoring this might be able to go into place order
   @summary << [name, quantity, @sum]
  end

end