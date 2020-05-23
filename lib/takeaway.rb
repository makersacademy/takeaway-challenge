require_relative 'menu'
require_relative 'kitchen'
require_relative 'text'

class TakeAway
  attr_reader :menu, :kitchen, :text

  def initialize(menu = Menu.new, kitchen = Kitchen.new, text = Text.new)
    @menu = menu
    @kitchen = kitchen
    @text = text
  end

  def menu_list 
    @menu.print_menu
  end

  def place_order(order)
    @kitchen.order(order)  
  end

  def checkout
    fail "Can not process the order: no items selected" if empty?
    
    @kitchen.order_total
  end

  def confirm_order(phone)
    @text.sms(phone)
  end

  private

  def empty?
    @kitchen.order_cart.empty?
  end
  
end
