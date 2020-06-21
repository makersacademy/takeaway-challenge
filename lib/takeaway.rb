require_relative 'menu'

class Takeaway
  attr_reader :order

  def initialize(menu)
    @menu = menu
    @order = {}
  end

  def see_menu
    display = String.new
    @menu.list.each do |dish, price|
       display << "#{dish}: £#{price}\n"
    end
    display
  end

  def place_order(item, quantity)
    if !@menu.list.include?(item.to_sym) 
      raise "Sorry we don't do that here"
    end
    @order.store item.to_sym, quantity.to_i
  end

end