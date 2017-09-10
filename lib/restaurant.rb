require 'dotenv/load'
require_relative 'notifier'
require_relative 'menu'
require_relative 'order'

class Restaurant

  attr_reader :name, :address, :menu, :current_order

  def initialize(name, address, menu = Menu.new, notifier = Notifier.new)
    @name = name
    @address = address
    @notifier = notifier
    @menu = menu
    @orders = []
  end

  def create_customer_order
    @current_order = Order.new(@menu)
  end

  def accept_customer_order
    @notifier.send_message("Your order was accepted")
  end

  def cancel_customer_order

  end

end
