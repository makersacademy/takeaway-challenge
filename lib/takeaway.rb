require_relative 'menu'
require_relative 'kitchen'
require_relative 'text'

class TakeAway
  attr_reader :kitchen
  def initialize
    @menu = Menu.new
    @kitchen = Kitchen.new
    @text = Text.new
  end

  def menu_list 
    @menu.print
  end

  def order(order)
    @kitchen.order(order)
  end

  def checkout
    fail "Can not process the order: no items selected" if empty?
    @kitchen.order_total
  end

  private

  def empty?
    @kitchen.order_cart.empty?
  end

end