require_relative 'basket'
require_relative 'messager_twilio'
require_relative 'menu'

class Takeaway
  def initialize(messager = MessagerTwilio.new,
                 basket = Basket.new,
                 menu = Menu.new)
    @messager = messager
    @basket = basket
    @menu = menu
  end

  def menu
    @menu.all
  end

  def add_to_order(index, quantity)
    quantity.times { @basket.add(@menu.get(index)) }
    @basket
  end

  def basket
    @basket.contents
  end
  
  def confirm(price)
    raise "Cannot confirm order: the price was wrong. "\
          "Check your maths! 😜" if price != @basket.total

    send_confirmation_message
    true
  end

  private

  attr_reader :messager

  def send_confirmation_message
    one_hour_from_now = (Time.new + 3600).strftime("%H:%M")
    message = "Thank you! Your order was placed and will be delivered before "\
              "#{one_hour_from_now}."
    messager.send(message)
  end
end
