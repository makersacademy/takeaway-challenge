require 'csv'
require_relative 'dish'

class Menu

  def initialize(menu_file = nil)
    @menu = read_menu_file(menu_file)
  end

  def show_menu
    @menu
  end

  private

  def read_menu_file(menu_file)
    list = []
    if File.exists?(menu_file)
      File.open(menu_file, 'r') do |file|
        file.each_line do |line|
          line = line.chomp.split(',')
          list << Dish.new(name: line[0], price: line[1].to_f)
        end
      end
    else
      list << {name: "The menu is unavailable at the moment", price: 0}
    end
    list
  end

end
