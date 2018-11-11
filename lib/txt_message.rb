require 'rubygems'
require 'twilio-ruby'

class MessagingService

  attr_accessor :order_time, :delivery_time

  def time_of_order
    @order_time = Time.now
  end

  def delivery_time
    @delivery_time = time_of_order + 3600
  end

  def send_message
    account_sid = 'AC4643f4df89b3db7d2a970f554fb7b986'
    auth_token = 'fe29e4844710cde179f5ab7ce290542f'
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    message = @client.messages.create({
      :from => '+441315102426',
      :to => '+447931741021',
      :body => "Thank you!, your order was placed and will be delivered before #{delivery_time.hour}:#{delivery_time.min}"
    })
    message.status
  end

end
