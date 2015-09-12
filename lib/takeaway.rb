require 'twilio-ruby'

class Takeaway
  # put your own credentials here
  @account_sid = 'ACc9a80215897ab2945cfb24f869fbf293'
  @auth_token = '3c8e9f010f3df56c4c463633b30ad6d3'

  # set up a client to talk to the Twilio REST API
  # @client = Twilio::REST::Client.new account_sid, auth_token

  def menu
    @menu = { 'Tomato soup' => 5,
              'Steak and chips' => 15,
              'Salmon Stew' => 12,
              'Chicken currey' => 10,
              'Beef casserole' => 18 }
  end

  def calculate_delivery_time
    @time = Time.now
    @hour = time.hour + 1
    @minute = time.min
    @time_1hour = @hour.to_s + ":" + @minute.to_s
    @time_1hour
  end

  def receive_order
    send_message
  end

  def send_message
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    @client.messages.create({
      :from => '+441604280198',
      :to => '+447850122007',
      :body => "Your order has been received and should be with you at #{calculate_delivery_time}",
    })
  end

end
