require 'menu'
require 'order'
require 'messenger'

class Takeaway
  attr_reader :menu, :order, :messenger

  def initialize
    @menu = Menu.new
    @order = Order.new
    @messenger = Messenger.new
  end
end
