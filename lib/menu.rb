require_relative "output_menu"

class Menu

  attr_reader :menu

  def initialize(output_menu = Output_Menu.new)
    @output_menu = output_menu
    @menu = [{item: "Item 1", price: 1.50},
             {item: "Item 2", price: 2.50}]
  end

  def display_menu
    @output_menu.display(menu)
  end

end
