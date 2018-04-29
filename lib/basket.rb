require_relative 'menu'
require_relative 'order'
require_relative 'dish'

class Basket

  attr_reader :selection, :menu

  def initialize(menu = Menu.new)
    @selection = Order.new
    @menu = menu
  end

  def display_menu
    puts @menu.display
  end

  def add_to_selection(number, quantity = 1)
    quantity.times { @selection.items << @menu.list[number - 1] }
  end

  def selection_total
    puts "Your total is £#{@selection.total}"
  end
end
