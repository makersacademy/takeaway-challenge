require_relative "menu"
require_relative "order"
require_relative "messager"
require "rubygems"
require "twilio-ruby"
require 'dotenv'
Dotenv.load

class TakeAway

  def initialize(menu, order_class: Order)
    @menu = menu
    @order = order_class.new(@menu)
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
      Messager.new.send(message)
    end
end
