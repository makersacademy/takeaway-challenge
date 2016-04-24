# require 'rubygems'
# require 'twilio-ruby'
require_relative 'order'
require_relative 'menu'

class Restaurant

  def initialize(order_class = Order.new, menu_class = Menu.new)
    @order_class = order_class
    @menu_class = menu_class
  end

  def show_menu
    @menu_class.menu
  end

  def add_to_order(quantity,item)
    menu_item = @menu_class.menu.select{|key,value|key["#{item}"]}
    @order_class.add_to_order(quantity,menu_item)
    puts "#{quantity} X #{menu_item.keys} added to basket"
  end

  def show_order
    @order_class.show_order
  end

  def check_total
    @order_class.check_total
  end

  # def checkout(amount)
  #   future_time = Time.now + 3600
  #   error_message = "Amount is not correct. You balance to pay is #{check_total}"
  #   fail error_message unless amount == check_total
  #
  #   account_sid = 'ACa853e1ef5346864a0d7d654da29a382c'
  #   auth_token = '2ff50b24738e8fd05f6f5f9ce7602323'
  #   begin
  #     @client = Twilio::REST::Client.new account_sid, auth_token
  #     @client.account.messages.create({
  #       :from => '+441923750654',
  #       :to => '+447740******',
  #       :body => "Thanks! Your order has been placed, and it will be with you by #{future_time.strftime("%H:%M")}"})
  #     rescue Twilio::REST::RequestError => e
  #       puts e.message
  #   end
  # end
end
