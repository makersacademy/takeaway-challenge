# It is responsbile for holding information about the order delivery
require_relative 'auth_token'
require_relative 'order'
require 'twilio-ruby'

class Delivery

  attr_reader :delivery_time
  DELIVERY_ESTIMATE = 60 * 60

  def initialize(order_time)
    @delivery_time = (order_time + DELIVERY_ESTIMATE).strftime("%I:%M %p")
    @send_sms_from_number = Authorization::AUTH_SMS_SENDER_NUMBER
    @user_contact_number = Authorization::USER_CONTACT_NUMBER
  end

  def send_notification
    @delivery_notification = "Thank you! You're order will be delivered before #{@delivery_time}"

    account_sid = 'AC59a274e32e8dabfb2e8d4299c2ca7503'
    auth_token = Authorization::AUTH_TOKEN
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.account.messages.create({
      :from => @send_sms_from_number,
      :to => @user_contact_number,
      :body => @delivery_notification
      })

    @delivery_notification
  end

end
