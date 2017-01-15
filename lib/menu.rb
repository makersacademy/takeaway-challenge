#understands holding menu items together as a menu
require_relative "menu_item"
require_relative "printer"
require_relative "menu_loader"
require "yaml"

class Menu
  attr_reader :menu_location

  def initialize args = {}
    args = defaults.merge(args)
    @items      = []
    @menu_item_class = args[:menu_item_class]
    @menu_printer    = args[:menu_printer]
    @menu_loader     = args[:menu_loader]
    @menu_location   = args[:menu_location]
    generate_menu
  end

  def items
    @items.dup
  end

  def add_to_menu args
    @items << menu_item_class.new(args)
  end

  def to_s printer_module = menu_printer
    printer_module.to_string self
  end

  def get_item item
    output =  get_item_by_id item   if item.class == Fixnum
    output =  get_item_by_name item if item.class == String
    raise "item not found: #{item}" if output.nil?
    output
  end

  private
  attr_reader :menu_item_class
  attr_reader :menu_printer
  attr_reader :menu_loader
  attr_reader :menu_file

  def get_item_by_id item
    items[item-1]
  end

  def get_item_by_name item
    items.select{|menu_item| menu_item.name == item}[0]
  end

  def defaults
    {menu_item_class: MenuItem,
     menu_printer:    Printer,
     menu_loader:     MenuLoader,
     menu_location:   "./lib/menu.yml"}
  end

  def generate_menu
    menu_loader.load self
  end
end
