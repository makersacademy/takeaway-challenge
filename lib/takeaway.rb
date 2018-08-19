require './data/takeaway_menu.rb'

class Takeaway

  attr_reader :menu
  attr_accessor :basket
  def initialize(menu = MENU_LIST)
    @menu = menu
    @basket = []
  end

  def display_menu
    menu
  end

  def add_item(item)
    @basket.push(item)
  end
end