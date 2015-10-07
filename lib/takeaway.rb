require 'twilio-ruby'
# require_relative '../.env.rb'

class Takeaway

  attr_reader :menu

  def initialize
    @menu = { :tomato_soup => 5,
              :steak_and_chips => 15,
              :salmon_stew => 12,
              :chicken_curry => 10,
              :beef_casserole => 18 }
  end

  def calculate_delivery_time(time = Time.now)
    hour = time.hour + 1
    minute = time.min
    time_in_1hour = hour.to_s + ":" + minute.to_s
  end

  def send_message
    @account_sid = 'ACc9a80215897ab2945cfb24f869fbf293'
    @auth_token = '3c8e9f010f3df56c4c463633b30ad6d3'
    @client = ::Twilio::REST::Client.new @account_sid, @auth_token
    @client.messages.create(
      from: '441315101887',
      to: '+447850122007',
      body: "Your order of has been received and should be with you at #{calculate_delivery_time}",
    )
  end

end
