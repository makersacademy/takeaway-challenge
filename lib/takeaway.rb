# manages the ordering process

require_relative 'menu'
require_relative 'printer'
require_relative 'basket'

class Takeaway
  attr_reader :takeaway_menu, :menu_on_screen, :basket

  def initialize(cuisine = 'turkish')
    @basket = Basket.new
    @takeaway_menu = Menu.new(cuisine).menu
  end

  def show_menu
    @menu_on_screen = Printer.new(@takeaway_menu).printed_menu
    puts @menu_on_screen
  end

  def order(item_ref)
    @basket.add(@takeaway_menu[item_ref - 1])
  end
end
