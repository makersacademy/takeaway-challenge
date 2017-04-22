# manages the ordering process

require_relative 'menu'
require_relative 'menu_printer'
require_relative 'basket'
require_relative 'checkout'
require_relative 'text'
require_relative 'test'

class Takeaway
  attr_reader :takeaway_menu, :basket, :checkout

  def initialize(cuisine = 'turkish')
    @basket = Basket.new
    @takeaway_menu = Menu.new(cuisine).menu
  end

  def show_menu
    puts MenuPrinter.new(@takeaway_menu).printed_menu
  end

  def order(item_ref)
    @basket.add(@takeaway_menu[item_ref])
  end

  def checkout
    fail 'You have nothing in your basket' unless order_in_progress?
    @checkout = Checkout.new(@basket)
    puts @checkout.final_summary
  end

  def pay(payment, text_message = TextMessage.new)
    fail "You have paid the wrong amount." if ('%.2f' % payment) != ('%.2f' % basket.total_cost)
    text_message.paid(payment)
    puts "Your order will be confirmed by text message. Thank you."
  end

  private

  def order_in_progress?
    @basket.current_order != []
  end
end
