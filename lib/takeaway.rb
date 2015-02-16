
require 'twilio-ruby'

class TakeAway

  attr_accessor :customer, :order

  def initialize(customer, order)
    @customer = customer
    @order = order
  end

  def text_message
    account_sid = 'AC4ebef83430957893399df516bf327fd6'
    auth_token = '6ce4e9628363d241401e5b007ebd9955'
    @client = Twilio::REST::Client.new account_sid, auth_token

    message = @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before 18:52",
        :to => "+447730613823",
        :from => "+441465915035")
    puts message.sid
  end

end