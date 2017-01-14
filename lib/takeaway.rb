require_relative "menu.rb"
require_relative "dish.rb"
require_relative "menu_printer.rb"

class Takeaway

  attr_reader :menu

  def initialize(menu)
    @menu = menu
  end

  def show_menu

  end

  def place_order

  end

end
