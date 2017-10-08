require_relative './menu.rb'
require_relative './basket.rb'
require_relative './message_service.rb'

class Takeaway

  attr_reader :basket_class

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
    validate_dish(dish)
    quantity.times { basket.add(dish, menu.items[dish]) }
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

  private

  attr_reader :menu, :message_service, :basket

  def validate_dish(dish)
    fail 'dish is not on the menu' unless menu.items[dish]
  end

  def send_confirmation
    message_service.send_sms("Thank you for your order")
  end

end
