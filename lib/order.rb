require './lib/menu.rb'
require './lib/ui.rb'

class Order

  attr_reader :menu

  def intialize
  end

  def menu_printer(menu = Menu.new)
    puts menu.printer
  end


end
