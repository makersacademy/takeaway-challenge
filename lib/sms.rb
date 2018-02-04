require 'twilio-ruby'
require 'dotenv/load'

class SMS

  def send_sms(phone_number)

    account_sid = ENV['account_sid']
    auth_token = ENV['auth_token']

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create({
      :from => ENV['from_phone'],
      :to => "+44#{phone_number[1..-1]}",
      :body => "Thank you for your order! It will be delivered to you by #{delivery_time}."
    })

  end

  private

  def delivery_time
    (Time.new + 3600).strftime("%H:%M")
  end

end
