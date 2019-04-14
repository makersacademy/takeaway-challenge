require('twilio-ruby')
require("bundler")
Bundler.require()
require_relative 'restaurant'

class TextNotifier

  def initialize
    @time = Time.new
    @account_sid = "AC14cce02cf8e2c31d91a625aafaf65139"
    @auth_token = ENV["AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send
    @client.messages.create(
      to: ENV["MY_PHONE_NUMBER"],
      from: "+441793250256",
      body: "Your order has been placed and will be with you at #{@time.hour + 1}:#{@time.min}."
    )
  end
end
