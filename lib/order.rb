require_relative 'print_menu'

class Order

  attr_reader :current_order

  def initialize(print_menu_class = PrintMenu)
    @current_order = []
    @print_menu_class = print_menu_class
  end



end
