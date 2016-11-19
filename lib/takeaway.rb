require_relative 'menu.rb'

class Takeaway

  attr_reader :menu, :items

  def initialize
    @menu = Menu.new
    @items = {}
  end

  def show_menu
    menu.show_menu
  end

  def add_item(item, quantity)
    items[item] = quantity
  end

end
