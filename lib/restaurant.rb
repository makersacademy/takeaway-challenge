require 'printer'

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


end
