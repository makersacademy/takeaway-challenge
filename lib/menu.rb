require_relative "output_menu"

class Menu

  attr_reader :output_menu, :menu

  def initialize(output_menu = Output_Menu.new)
    @output_menu = output_menu
    @menu = [{item: "Curry", price: 1.50}]
  end

  def display_menu
    output_menu.display(menu)
  end

end
