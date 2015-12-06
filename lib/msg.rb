require 'rubygems'
require 'twilio-ruby'

class Msg
  attr_reader :delivery_time

  def expected_time
    @delivery_time = (Time.new + 3600).hour.to_s + ":" + (Time.new + 3600).min.to_s
  end

  def send_confirmation

    expected_time

    account_sid = "enter your Twilo account_sid here"
    auth_token = "enter your Twilo auth_token here"
    client = Twilio::REST::Client.new account_sid, auth_token

    from = "enter your Twilo phone number here"

    customer = {"number" => "Me"}

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
