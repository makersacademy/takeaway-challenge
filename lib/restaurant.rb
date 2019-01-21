require_relative 'menu'

class Restaurant

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu.menu
  end

  def order
  end

  def view_menu
    @menu
  end

end










# require 'twilio-ruby'
#
# account_sid = "AC0349e1809352be820a6c77ae506d5f84" # Your Account SID from www.twilio.com/console
# auth_token = "c53285967bdfd523b91ca59acc5350c4" # Your Auth Token from www.twilio.com/console
#
# @client = Twilio::REST::Client.new account_sid, auth_token
# message = @client.messages.create(
#     body: "Hello from Ruby",
#     to: "+44*************",    # Replace with your phone number
#     from: "+***************")  # Replace with your Twilio number
#
# puts message.sid
