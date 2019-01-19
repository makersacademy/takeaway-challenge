require_relative 'Menu'
require_relative 'Calculator_module'

class Restaurant

attr_reader :menu
include Calculator

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def bill
    @order = menu.your_order
    calculate(@order)
  end

end
