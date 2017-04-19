require 'csv'
require_relative 'dish'

class Menu
  attr_reader :basket

  def initialize(menu_file = nil)
    @menu = read_menu_file(menu_file)
    @basket = []
  end

  def show_menu
    @menu
  end

  def add_item(item)
    message = "This dish does not exist in the menu!"
    raise message unless show_menu.include?(item)
    @basket << item
  end

  def remove_item(item)
    message = "This dish does not exist in your basket!"
    raise message unless basket.include?(item)
    @basket.delete_at(@basket.index(item))
  end

  private

  def read_menu_file(menu_file)
    if File.exist?(menu_file)
      parse_menu_file(menu_file)
    else
      [Dish.new(name: "The menu is unavailable at the moment", price: 0)]
    end
  end

  def parse_menu_file(menu_file)
    list = []
    File.open(menu_file, 'r') do |file|
      file.each_line do |line|
        line = line.chomp.split(',')
        list << Dish.new(name: line[0], price: line[1].to_f)
      end
    end
    list
  end

end
