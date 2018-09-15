# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

class Menu
  attr_reader :account_sid, :auth_token,
              :client, :from, :to

  def initialize(client = Twilio::REST::Client.new(account_sid, auth_token))
    @account_sid = 'ACbad1cc1fe45037b01a7fd207fb7f270c'
    @auth_token = '2223f6422dca48314885d82d94b3d005'
    @client = client
    @from = '+447480485499' # Your Twilio number
    @to = '+447828166080' # Your mobile phone number
  end


  def send_message
    client.messages.create(
    from: from,
    to: to,
    body: "you've placed a takeaway order, it will arrive in 50mins"
    )
  end
end

# menu class:
# list of all the items on the Menu
# select any number of a single dish on the menu
# check the balance on my current takeaway list, printing out individual prices
# complete the order on my current takeaway - get send message class to send a message

# send_message class:
# take an argument of the total balance and send a message with that balance
