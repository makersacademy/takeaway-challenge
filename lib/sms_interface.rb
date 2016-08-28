require 'twilio-ruby'

class SmsInterface

  def initialize(client = twilio_client, from = '+441263456026')
    @client = client
    @from = from
  end

  def send_text(number, message)
    @client.create(from: @from, to: number, body: message)
  end

  private

  def twilio_client
    account = 'AC9bcded299fb95a569ac61146b57a7c30'
    key = '386b834667ff3435c7729d2561050b98'
    Twilio::REST::Client.new(account, key).account.messages
  end 
end
