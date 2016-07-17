require_relative 'menu'
require_relative 'order'
require 'twilio-ruby'

class Takeaway

  attr_reader :menu, :customer_order

  def initialize(menu = Menu.new, customer_order = Order.new)
    @menu = menu
    @customer_order = customer_order
  end

  def show_menu
    menu.dishes.each do |dish|
      puts "#{dish.name}, £#{dish.price}"
    end
  end

  def check_total
    "Your order will cost £#{customer_order.total_bill}"
  end

  def confirm_order
   send_text("Thanks! Your order has been placed, will cost £#{@customer_order.total_bill} and will be delivered by #{@customer_order.delivery_time}")
  end

private

 def send_text(message)
   # put your own credentials here
   account_sid = 'AC65ae21135d2364a4ad045bd634c4c82f'
   auth_token = '0f4c6c42987696a3b1ab8f6298330650'
   # set up a client to talk to the Twilio REST API
   @client = Twilio::REST::Client.new account_sid, auth_token
   @client.account.messages.create(
     from: '+441620282038',
     to: '+447934491522',
     body: message
   )
   end

end
