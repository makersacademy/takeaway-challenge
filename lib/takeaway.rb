# manages the ordering process

require_relative 'menu'
require_relative 'printer'

class Takeaway
  attr_reader :takeaway_menu, :menu_on_screen

  def initialize(cuisine = 'turkish')
    @takeaway_menu = Menu.new(cuisine).menu
  end

  def show_menu
    @menu_on_screen = Printer.new(@takeaway_menu).printed_menu
    puts @menu_on_screen
  end
end
