require_relative 'menu'

class Order

  attr_reader :order
  
  def initialize
    @menu = Menu.new.print_menu
    @order = []
  end

  def add_items(item)
    @order << @menu[item - 1]
  end
end