require_relative 'menu'

class TakeAway
  attr_reader :basket, :menu

  def initialize
    @menu = Menu.new
    @basket = {}
  end

  def show_menu
    @menu.dishes
  end
end
