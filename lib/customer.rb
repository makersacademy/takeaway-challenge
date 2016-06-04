#gets food from menu
require './lib/printer.rb'

class Customer

  def initialize(menu)
    @printer = Printer.new
    @menu = menu
  end

  def see_menu
    @printer.print(@menu)
  end

end
