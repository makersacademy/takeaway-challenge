
require_relative 'menu.rb'
require_relative 'calculate.rb'

class Takeaway
include Calculate_order

  def initialize(restaurant_type)
    @menu = Menu.new(restaurant_type)
  end

  def show_menu
    @menu.show
  end

  def complete_order(order_list)
    mail if calculate(order_list, @menu)
  end

  #def order
    #@order = order_input(@menu)
  #end
private
  def mail
  end

end
