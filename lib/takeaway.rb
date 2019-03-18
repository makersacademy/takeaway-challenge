require_relative 'menu'
require_relative 'text_message'
require_relative 'order'

class Takeaway  
  attr_reader :menu, :text

  def initialize(menu = Menu.new, text = Text, order = Order.new)
    @menu = menu
    @text = text
    @order = order
  end

  def show_menu
    @menu.print
  end

  def order(dish, quantity)
    @order.add_dishes(dish, quantity)
  end

  def show_basket
    @order.show_basket
  end
  

end
