require_relative 'menu'
require_relative 'kitchen'

class TakeAway
  attr_reader :kitchen
  def initialize
    @menu = Menu.new
    @kitchen = Kitchen.new
  end

  def menu_list 
    @menu.print
  end

  def order(order)
    @kitchen.order(order)
    # @kithen.test(order)
  end

  def checkout
    @kitchen.order_total
    @kitchen.order_complete = true
  end

end