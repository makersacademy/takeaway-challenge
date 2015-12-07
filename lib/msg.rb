require 'twilio-ruby'
require 'dotenv'

class Msg
  attr_reader :delivery_time, :credentials

  def initialize
    @credentials = Dotenv.load
  end

  def expected_time
    @delivery_time = (Time.new + 3600).hour.to_s + ":" + (Time.new + 3600).min.to_s
  end

  def send_confirmation
    expected_time

    account_sid = credentials["account_sid"]
    auth_token = credentials["auth_token"]
    client = Twilio::REST::Client.new account_sid, auth_token

    from = credentials["TWILIO_NUMBER"]
    customer = {credentials["my_number"] => "Me"}

    customer.each do |key, value|
      client.account.messages.create(
      :from => from,
      :to => key,
      :body => "Your order was successful and should arrive by #{delivery_time}."
      )
      return "Sent message to #{value}"
    end
  end
end
