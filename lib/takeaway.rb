require_relative 'menu'

class Takeaway
  attr_reader :menu

  def initialize(dishes)
    @menu = Menu.new dishes
    @order = Hash.new(0)
    @total = 0
  end

  def display_menu
    puts @menu.print_dishes
  end

  def order
  end
end
