require_relative 'menu'

class Restaurant
  attr_reader :name

  def initialize(name, menu = Menu.new)
    @name = name
    @menu = menu
  end

  def add_menu_item(name, price)
    @menu.add_item(name, price)
  end

end
