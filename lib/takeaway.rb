require_relative 'menu'

class TakeAway

  attr_reader :basket, :menu

  def initialize
    @basket = {}
    @menu = Menu.new
  end

  def read_menu
    menu.dishes
  end
end
