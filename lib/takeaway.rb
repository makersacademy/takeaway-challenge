require_relative 'order'
require_relative 'messager_twilio'
require_relative 'menu'

class Takeaway
  def initialize(messager = MessagerTwilio.new,
                 order = Order.new,
                 menu = Menu.new)
    @messager = messager
    @order = order
    @menu = menu
  end

  def menu
    @menu.all
  end

  def pretty_menu
    puts @menu.pretty
  end

  def add_to_order(index, quantity)
    quantity.times { order.add(@menu.get(index)) }
    basket
  end

  def basket
    order.basket
  end
  
  def confirm(price)
    raise "Cannot confirm order: the total was wrong. "\
          "Check your maths! 😜" unless order.confirm(price)

    send_confirmation_message
    true
  end

  private

  attr_reader :messager, :order

  def send_confirmation_message
    one_hour_from_now = (Time.new + 3600).strftime("%H:%M")
    message = "Thank you! Your order was placed and will be delivered before "\
              "#{one_hour_from_now}."
    messager.send(message)
  end
end
