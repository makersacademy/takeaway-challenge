require_relative 'menu'

class Takeout

  attr_reader :menu, :my_order, :total

  def initialize
    @menu = Menu.new('menu.csv')
    @my_order = []
    @total = 0
  end



  def order

  end



end
