require_relative './menu.rb'
require_relative './basket.rb'
require_relative './message_service.rb'
require 'date'

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
    confirm_added(dish, quantity)
  end

  def order_summary
    basket.summary
  end

  def order_total
    "Total = £#{basket.total}"
  end

  def checkout(payment)
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

  def confirm_added(dish, quantity)
    "#{quantity} #{dish}#{plural(quantity)} added to basket"
  end

  def plural(quantity)
    's' if quantity > 1
  end

  def send_confirmation
    text = "Thank you! Your order was placed and will be delivered before"
    time = (DateTime.now+(1/24.0)).strftime("%R")
    message_service.send_sms("#{text} #{time}")
  end

  def correct_ammount?(payment)
    payment == basket.total
  end

end
