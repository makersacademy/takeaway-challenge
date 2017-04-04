require_relative "output_menu"

class Menu

  attr_reader :menu

  def initialize(output_menu = Output_Menu.new)
    @output_menu = output_menu
    @menu = []
    read_menu_file
  end

  def display_menu
    @output_menu.display(menu)
  end

  private

  def read_menu_file
    File.readlines("./lib/menu.txt").each do |line|
      item, price = line.split(":")
      @menu << {item: item, price: price.to_f}
    end
    @menu
  end

end
