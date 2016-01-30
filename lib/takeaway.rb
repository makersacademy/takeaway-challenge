
require_relative 'menu.rb'
require_relative 'calculate.rb'
require_relative 'mail.rb'

class Takeaway
attr_reader :menu

include Calculate_order
  def initialize(restaurant_type)
    @menu = Menu.new(restaurant_type).menu
    @mail = Mail.new
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
    @mail.send
  end

end
