# It is responsbile for holding information about the order delivery
require_relative 'order'
require 'twilio-ruby'

class Delivery

  attr_reader :delivery_time
  DELIVERY_ESTIMATE = 60 * 60

  def initialize(order_time)
    @delivery_time = (order_time + DELIVERY_ESTIMATE).strftime("%I:%M %p")
    @sms_number = '+441952780147'
    @user_contact_number = '+447843627130'
  end

  def send_notification
    # account_sid = 'AC59a274e32e8dabfb2e8d4299c2ca7503'
    # auth_token = '549ea7cdba5c041228b186232c0de92d'
    # @client = Twilio::REST::Client.new(account_sid, auth_token)
    #
    # @client.account.messages.create({
    #   :from => @sms_number,
    #   :to => @user_contact_number,
    #   :body => 'This is your delivery notification'
    #   })
    message_sent_notification = "Thank you! You're order will be delivered before #{@delivery_time}"
  end

end
