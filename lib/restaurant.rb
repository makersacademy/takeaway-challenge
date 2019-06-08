require 'twilio-ruby'
require_relative './secrets.rb'

module Restaurant

  def self.confirm_order(_order, secrets = Secrets)
    client = Twilio::REST::Client.new(secrets::ACCOUNT_SID, secrets::AUTH_TOKEN)
    client.messages.create(
      from: secrets::FROM,
      to: secrets::TO,
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time}"
      )
  end

  private

  def self.delivery_time
    time = Time.new
    "#{time.hour + 1}:#{time.min}"
  end

end
