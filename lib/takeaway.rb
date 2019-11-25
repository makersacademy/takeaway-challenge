require 'twilio-ruby'
require_relative 'order'
require_relative 'menu'
require_relative 'text'

class Takeaway 

  attr_reader :order_history

  def initialize(menu = Menu.new)
    @menu = menu
    @order_history = []
  end

  def show_menu
    @menu.view
  end

  def submit_order(order, tendered, text_class = Text)
    raise "Incorrect amount tendered, order not successful" if order.total != tendered
    
    @text = text_class.new
    @order_history << order
  end
end
