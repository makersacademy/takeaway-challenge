require_relative 'menu'

class Order

  attr_reader :menu, :order

  def initialize(menu = nil)
    @menu = Menu.new(menu)
    @order = []
  end

  def display_menu
   @menu.print 
  end

  def add_dish(dish, quantity = 1)
    raise 'Sorry, this item is not on our menu.' if on_menu?(dish)
    quantity.times { @order << find_dish(dish) }
  end

  private

  def on_menu?(dish)
    @menu.menu.select { |dish, price| dish == price }.length < 1
  end

  def find_dish(dish)
    @menu.menu.select { |dish, price| dish == price }
  end

end
