require 'sinatra'
require 'twilio-ruby'

class Text
  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

  end

  def send_message(message, customer_mobile)
    client.account.messages.create({
      :from => '+441143032484',
      :to => customer_mobile,
      :body => message,
      })
  end

  private

  ACCOUNT_SID= 'ACc640281be37f4406d87815bf22bc7d33'
  AUTH_TOKEN = '8d4fec8704977e0cf1551088fe6c4a3f'

end
