require_relative "menu.rb"
require_relative "sms.rb"
require 'dotenv'
Dotenv.load

class Order

  attr_reader :basket, :menu, :sms

  def initialize(menu = Menu.new)
    @basket = {}
    @menu = menu
    @sms = SMS.new
  end

  def add_dish(dish, quantity)
    raise "Dish not available. Please see menu for options." if !menu.dishes.include?(dish)
    basket.store(dish, quantity)
    return "#{quantity} x #{dish}(s) added to your basket."
  end

  def read_menu
    p menu.welcome
    menu.print_dishes
  end

  def total
    total = 0
    basket.each do |k, v|
      total = total + (v * menu.get_price(k))
    end
    total
  end

  def order_total
    p "Your order total is £#{total}"
  end

  def basket_summary
    basket.map do |k, v|
      "#{v}x #{k}(s) = £#{(v * menu.get_price(k)).to_i}"
    end
  end

  def checkout
    p "Enter 'Yes' if you would like to place your order"
    confirm = gets.chomp
    if confirm == 'Yes'
      confirmation
      basket.clear
    else
      return nil
    end
  end

private

  def confirmation
    sms.send_sms("Thankyou! Your order was placed and will be delivered before #{delivery_time}")
  end

  def delivery_time
   (Time.now + (60 * 60)).strftime("%H:%M")
 end

end
