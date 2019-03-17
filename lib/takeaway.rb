require_relative 'menu'
require_relative 'text_message'

class Takeaway  
  attr_reader :menu, :text

  def initialize(menu = Menu.new, text = Text)
    @menu = menu
    @text = text
    @order_basket = []
  end

  def show_menu
    @menu.print
  end

  def order(dish, quantity = 1)
    @order_basket << [dish, quantity]
  end

  def send_message(message)
    @text.new.send(message)
  end

end
