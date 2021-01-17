require 'twilio-ruby'

class Sms

  def initialize
    @account_sid = ENV["TWILIO_ACCOUNT_SID"]
    @auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @takeaway_from_number = ENV["TAKEAWAY_FROM_NUMBER"]
    @takeaway_to_number = ENV["TAKEAWAY_TO_NUMBER"]
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send_message(message)
    @client.messages.create(
      from: @takeaway_from_number,
      to: @takeaway_to_number,
      body: message)
  end
end
