require 'twilio-ruby'

require_relative 'send_text'
require_relative 'menu'

class Takeaway
  include SendText

  attr_reader :menu, :basket

  def initialize(menu_klass: Menu)
    @basket = []
    @menu = menu_klass.new
  end

  def show_menu
    menu.show
  end

  def order(item, qty = 1)
    basket << [item, qty]
    "#{item} x#{qty} added to your basket"
  end

  def basket_content
    basket.map do |item, qty|
      "#{item} x#{qty}: £#{qty * menu.dishes[item]}"
    end.join("\n")
  end

  def complete_order(price)
    fail 'Wrong total' if wrong_total?(price)
    delivery_time = (Time.now + 60*60).strftime("%H:%m")
    send_text "Your order has been confirmed!" +
              "Expect your yummie food by #{delivery_time}\n" +
              "Your order:\n" +
              "#{basket_content}\n" +
              "#{total}"
  end

  def total
    "Total price: £" + calculate_price.to_s
  end

private
  def calculate_price
    basket.map { |item, qty| qty * menu.dishes[item] }.inject(:+)
  end
  
  def wrong_total?(price)
    calculate_price != price
  end
end
