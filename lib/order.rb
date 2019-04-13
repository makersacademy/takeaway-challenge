require_relative 'menu'


class Order

  attr_reader :menu, :current_order

  def initialize
    @current_order = []
  end


  def view_menu
    @menu = Menu.new.dishes
  end



end
