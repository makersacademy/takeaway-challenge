module SMS
  require 'dotenv/load'
  require 'twilio-ruby'

  account_sid = ENV['twilio_account_sid']
  auth_token = ENV['twilio_auth_token']
  
  @client = Twilio::REST::Client.new(account_sid, auth_token)
  @restaurant = ENV['twilio_mobile_number']
  @customer = ENV['my_mobile_number']

  # :nocov:

  def self.send(body, from: @restaurant, to: @customer)
    begin
      @client.messages.create(from: from, to: to, body: body)
      "SMS sent: #{body}"
    rescue Twilio::REST::TwilioError => e
      "Failed to send SMS:\n#{e.message}"
    end
  end

  # :nocov:
end
