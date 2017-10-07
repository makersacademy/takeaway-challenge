require_relative './menu.rb'
require_relative './basket.rb'
require_relative './message_service.rb'

class Takeaway

  def initialize(menu = Menu.new,
                 basket_class = Basket,
                 message_service = MessageService.new
                 )
    @menu = menu
    @message_service = message_service
    @basket_class = basket_class
    @basket = basket_class.new
  end

  def print_menu
    menu.print
  end

  def order(dish, quantity = 1)
    fail 'item is not on the menu' unless menu.items[dish]
    quantity.times { @basket.add(dish, quantity) }
    puts "#{quantity} #{dish} added to basket"
  end

  def order_summary
    basket.summary
  end

  def order_total
    "Total = £#{basket.total}"
  end

  def checkout_order(payment)
    fail 'please pay the correct amount' unless payment == basket.total
    send_confirmation
    @basket = basket_class.new
  end

  # private

  attr_reader :menu, :basket_class, :basket, :message_service

  def send_confirmation
    message_service.send_sms("Thank you for your order")
  end

end
