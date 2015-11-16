require 'twilio-ruby'
require 'dotenv'
Dotenv.load

module TextingTwilio

  def self.send_text
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create(
      from: from_number,
      to: to_number,
      body: text_message)
  end

  private

  def self.delivery_time
    time = Time.new.getlocal + (60*60)
    time.strftime('%H:%M')
  end

  def self.text_message
    "Thank you! Your order has been placed and delivery " \
    "is scheduled for #{delivery_time}"
  end

  def self.account_sid
    ENV['ACCOUNT_SID']
  end

  def self.auth_token
    ENV['AUTH_TOKEN']
  end

  def self.from_number
    ENV['TWIL_PHONE_NUMBER']
  end

  def self.to_number
    ENV['MY_PHONE_NUMBER']
  end

end


