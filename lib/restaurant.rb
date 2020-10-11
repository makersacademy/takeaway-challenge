require 'printer'
require 'order'

class Restaurant

  include Printer

  attr_reader :menu

  def initialize
    @menu = {
      trout_snout: 6.50,
      hog_soup: 4.90,
      mysterious_dumpling: 8.00,
      boring_sandwich: 4.00,
      cuttlefish_pate: 11.00,
      hoof_broth: 3.30
    }
  end

  def print_menu(printer = Printer)
    printer.menu_printer(@menu)
  end

  def create_order(order = Order)
    @order = order.new
  end

  def choose_dish
    @choice = $stdin.gets.chomp
    @order.add(@menu.to_a[@choice.to_i - 1])
  end



end
