require 'rubygems'
require 'twilio-ruby'
class SendMessage

  attr_reader :account_sid, :auth_token, :client, :from

  def initialize
    @account_sid = "AC743a83644d7fb5a4343950f9c4ac71eb"
    @auth_token = "5295f23c5ab5872cef92984e881b648c"
    @client = Twilio::REST::Client.new account_sid, auth_token

    @from = "+441287244062"

  end

  def send(phone_number)
    self.customers.each do |name, number|
      delivery_time = Time.new + 3600
      self.client.account.messages.create(
      :from => self.from,
      :to => phone_number,
      :body => "Thank you! Your order was placed and will be delivered before #{delivery_time.strftime("%H:%M")}")
    end
  end

end
