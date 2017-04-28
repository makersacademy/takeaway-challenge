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
    fail 'You cannot order that item.' unless item_ref > 0 && item_ref < @takeaway_menu.count
    @basket.add(@takeaway_menu[item_ref])
  end

  def checkout
    fail 'You have nothing in your basket.' unless order_in_progress?
    @checkout = Checkout.new(@basket)
    puts @checkout.final_summary
  end

  def pay(payment, text_message = TextMessage.new)
    fail 'You have not checked out yet.' unless checked_out?
    fail "You have paid the wrong amount." if ('%.2f' % payment) != ('%.2f' % basket.total_cost)
    finalise_payment(text_message, payment)
  end

  private

  def finalise_payment(text_message, payment)
    text_message.paid(payment)
    puts "Your order will be confirmed by text message. Thank you."
    @basket = Basket.new
    @checkout = nil
  end

  def order_in_progress?
    @basket.current_order != []
  end

  def checked_out?
    @checkout != nil
  end
end
