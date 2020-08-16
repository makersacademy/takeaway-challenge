require 'twilio-ruby'
  
class Text

  def initialize
    @account_sid = ENV["TWILIO_ACCOUNT_SID"]
    @auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @shop_phone_number = ENV["SHOP_PHONE_NUMBER"]
    @customer_phone_number = ENV["CUSTOMER_PHONE_NUMBER"]
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send_text(message)
    @client.messages.create(
      from: @shop_phone_number,
      to: @customer_phone_number,
      body: message)
  end
end
