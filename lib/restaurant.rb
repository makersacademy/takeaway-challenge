require_relative 'menu'

class Restaurant

  attr_reader :menu

  def initialize
    @menu = Menu.new
  end

  def show_menu
    @menu.menu_list
  end

end

# require 'rubygems'
# require 'twilio-ruby'
#
# account_sid = 'AC63a8e0474ebbe1536675960e55c8c7d6'
# auth_token = 'b09fe6ca6eadeec97e3a28411aa7b5d2'
#
# @client = Twilio::REST::Client.new account_sid, auth_token
#
# @client.messages.create(
#   to: '+447962022211', #send message to customer (me)
#   from: '+441143032776', #twilio number
#   body: 'Thank you! Your order was placed and will be delivered before XXX'
# )
