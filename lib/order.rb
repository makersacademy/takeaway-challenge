require_relative 'menu'

class Order
  attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @menu = menu.menu
  end


end
