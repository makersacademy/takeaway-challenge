require 'rubygems'
require 'twilio-ruby'

class Order





  def initialize
    @customer_order = []
  end

  def place_order(item, quantity, menu)
    sub_total = menu.menu_items[item] * quantity
    @customer_order << [item, quantity, sub_total]
  end

  def customer_order
    @customer_order
  end


  def send_message
    account_sid = 'ACd7e183a027dbce9720341d1053705052'
    auth_token = 'fa5386f7c33d3f83b6a382ad8564261d'
    @client = Twilio::REST::Client.new account_sid, auth_token

    message = @client.account.messages.create(:body => customer_order,
      :to => "+447769111156",     # Replace with your phone number
      :from => "+441412804108")   # Replace with your Twilio number
    puts message.sid

  end
end


