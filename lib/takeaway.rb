require_relative "menu"
require_relative "order"
require_relative "messenger"
require "rubygems"
require "twilio-ruby"
require 'dotenv'
Dotenv.load

class TakeAway

  def initialize(menu, order_class: Order, messenger_class: Messenger)
    @menu = menu
    @order = order_class.new(@menu)
    @messager = messenger_class.new
  end

  def read_menu
    @menu.display
  end

  def order(item, quantity = 1)
    @order.add(item, quantity)
  end

  def basket_summary
    @order.summary
  end

  def total
    "Total: £#{@order.sum}"
  end

  def complete_order(price)
    send_text("Thank you for your order: £#{price}.") if amount_correct?(price)
  end

  private
    def amount_correct?(price)
      @order.sum == price
    end

    def send_text(message)
      @messager.send(message)
    end
end
