#understands holding menu items together as a menu
require_relative "menu_item"
require_relative "menu_printer"
require "yaml"

class Menu
  def initialize menu_file = nil, menu_item_class = MenuItem
    @menu_items = []
    @menu_item_class = menu_item_class
    generate_menu (menu_file)
  end

  def menu_items
    @menu_items.dup
  end

  def add_to_menu initialization_hash
    @menu_items << menu_item_class.new(initialization_hash)
  end

  def to_s(menu_printer = MenuPrinter)
    menu_printer.to_s
  end

  private
  attr_reader :menu_item_class

  def generate_menu menu_file
    return if menu_file.nil?
    data = YAML::load(File.open(menu_file))
    data.each{|item| add_to_menu item}
  end
end
