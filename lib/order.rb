require_relative 'menu'

class Order

  attr_reader :menu, :selection, :total

  def initialize(menu = Menu.new)
    @menu = menu
    @selection = {}
    @total = 0
  end

  def add_to_order(dish, quantity)
    @selection[dish.to_sym] = quantity
  end

  def order_total
    @selection.each do |dish, quantity|
      @total += (quantity * @selection.price(dish))
    end
    "Your bill: £#{@total}"
  end
end
