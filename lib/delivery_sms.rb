require 'twilio-ruby'

class DeliverySMS

  ONE_HOUR = 3600

  def initialize
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @from = ENV["TWILIO_PHONE_NUMBER"]
    @to = ENV["MY_PHONE_NUMBER"]
  end

  def send_confirmation

    delivery_time = Time.new + ONE_HOUR
    formated_delivery_time = delivery_time.strftime("%H:%M")
    response = "Thank you! Your order was placed and "
    response += "will be delivered by Owl before #{formated_delivery_time}."

    client.messages.create(
      from: from,
      to: to,
      body: response
    )
  end

  def send_by_sms(string)

    client.messages.create(
      from: from,
      to: to,
      body: string
    )

  end

  private

  attr_reader :client, :from, :to

end
