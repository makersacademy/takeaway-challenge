require_relative 'menu'

class Takeout

  attr_reader :menu, :total, :my_order

  def initialize
    @menu = Menu.new('menu.csv')
    @my_order = []
    @total = 0
  end

  def list_of_dishes
    menu.list_of_dishes
  end

  def order(key)
    @my_order << menu.dishes[key]
  end



end
