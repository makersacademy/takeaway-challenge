require_relative 'menu'
require_relative 'dishes'

class Take_Away

  attr_reader :menu, :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def read_menu
    @menu.dishes
  end

  def order(ordered_item)
    @basket << ordered_item
    puts "#{ordered_item} added to your basket."
  end

end
