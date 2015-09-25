
require 'twilio-ruby'
require_relative '../.env.rb'

module TwilioText

  def send_text
    Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token']).messages.create(
      from: ENV['phone'],
      to: ENV['my_phone'],
      body: text)
  end

  private

  def text
    "Thank you! Your order was placed and will be delivered by #{time}"
  end

  def time
    (Time.now + 60*60).strftime('%H:%M')
  end

end