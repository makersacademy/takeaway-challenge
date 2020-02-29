require_relative 'menu'

class Takeaway

  attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @basket = {}
    @menu = menu
  end

  def print_menu
    @menu.show_menu
  end






  
end