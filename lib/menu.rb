#understands holding menu items together as a menu
require_relative "menu_item"
require_relative "menu_printer"
require_relative "menu_loader"
require "yaml"

class Menu
  attr_reader :menu_location
  
  def initialize args = {}
    args = defaults.merge(args)
    @menu_items = []
    @menu_item_class = args[:menu_item_class]
    @menu_printer    = args[:menu_printer]
    @menu_loader     = args[:menu_loader]
    @menu_location   = args[:menu_location]
    generate_menu
  end

  def menu_items
    @menu_items.dup
  end

  def add_to_menu args
    @menu_items << menu_item_class.new(args)
  end

  def to_s (printer_module = menu_printer)
    printer_module.to_s
  end

  private
  attr_reader :menu_item_class
  attr_reader :menu_printer
  attr_reader :menu_loader
  attr_reader :menu_file


  def defaults
    {menu_item_class: MenuItem,
     menu_printer:    MenuPrinter,
     menu_loader:     MenuLoader,
     menu_location:   "./lib/menu.yml"}
  end

  def generate_menu
    menu_loader.load (self)
  end
end
