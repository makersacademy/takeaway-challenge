require_relative 'menu'

class Counter

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def show_menu
    @menu.show
  end

  def add_item(name, price)
    @menu.add_item(name, price)
  end
end
