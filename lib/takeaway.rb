require_relative './menu.rb'
require_relative './basket.rb'
require_relative './message_service.rb'

class Takeaway

  def initialize(menu = Menu.new,
                 basket = Basket.new,
                 message_service = MessageService.new
                 )
    @menu = menu
    @message_service = message_service
    @basket = basket
  end

  def print_menu
    menu.print
  end

  def order(dish, quantity = 1)
    fail 'dish is not on the menu' unless on_menu?(dish)
    add_items(dish, quantity)
    puts "#{quantity} #{dish} added to basket"
  end

  def order_summary
    basket.summary
  end

  def order_total
    "Total = £#{basket.total}"
  end

  def checkout_order(payment)
    fail 'please pay the correct amount' unless correct_ammount?(payment)
    send_confirmation
    basket.reset
  end

  private

  attr_reader :menu, :message_service, :basket

  def on_menu?(dish)
    !!menu.items[dish]
  end

  def add_items(dish, quantity)
    quantity.times { basket.add(dish, menu.items[dish]) }
  end

  def send_confirmation
    message_service.send_sms("Thank you for your order")
  end

  def correct_ammount?(payment)
    payment == basket.total
  end

end
