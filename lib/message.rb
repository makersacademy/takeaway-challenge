require_relative './order.rb'
require_relative './secret_data.rb'
require 'twilio-ruby'

class Message
  DELIVERY_TIME = 3600

  attr_reader :order_timestamp, :delivery_time

  def initialize(order_timestamp)
    @order_timestamp = order_timestamp
    @delivery_time = order_timestamp + DELIVERY_TIME
    @sms_number = '+441681292005'
    @user_contact_number = '+447377669808'
  end

  def send_sms
    account_sid = Authorisation:ACC_SID
    auth_token = Authorisation:AUTH_TOKEN
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.account.messages.create(from: @sms_number,
                                    to: @user_contact_number,
                                    body: 'This is your delivery notification.')
    :message_sent
    end
end
