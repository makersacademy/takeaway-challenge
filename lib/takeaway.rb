require_relative './menu.rb'
require_relative './order.rb'
require_relative './message_service.rb'

class Takeaway

  def initialize(menu = Menu.new, basket_class = Basket, message_service = MessageService.new)

    @menu = menu
    @message_service = message_service
    @basket_class = basket_class
    @basket = basket_class.new
    @total = 0

  end

  def order_total
    "Total = £#{@total}"
  end

  def print_menu
    menu.print
  end

  def order(dish, quantity = 1)
    fail 'item is not on the menu' unless menu.items[dish]
    quantity.times { @basket.add(dish, quantity) }
    "#{quantity} #{dish} added to basket"
  end

  def order_summary
    basket.summary
  end

  def checkout_order(payment)
    fail 'please pay the correct amount' unless payment == @total
    @basket, @total = [], 0
    send_confirmation
  end

  # private

  attr_reader :menu, :basket_class, :basket, :message_service

  def send_confirmation
    message_service.send_sms("Thank you for your order")
  end

end
