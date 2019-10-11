require 'twilio-ruby'

class Restaurant

  attr_reader :menu, :client

  def initialize
    @menu = {
      'chicken_burgers' => 2.50,
      'beef_burgers' => 2.50,
      'chips' => 1.00
    }
    account_sid = 'ACc8bac935d3e1a21f83ad014487be5ff6'
    auth_token = '21a68dd2f3b33f7705c6a186a935b4ac'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text(customers_order)
    @client.messages.create(
      from: '+441483608566',
      to: '+447551005318',
      body: "You have ordered #{customers_order[1]} #{customers_order[0]}, which has cost you #{customers_order[2]}"
    )
    true
  end
end
