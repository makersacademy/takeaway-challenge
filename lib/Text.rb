require 'twilio-ruby'
require './config.rb'
# Credit: https://gist.github.com/derzorngottes/3b57edc1f996dddcab25

class Text
  def initialize
    @config = Config.new
    @client = Twilio::REST::Client.new(@config.account_sid, @config.auth_token)
  end

  def send
    @client.messages.create(
      :from => @config.from,
      :to => @config.to,
      :body => "Thank you! Your order was placed \
      and will be delivered before #{delivery_time.strftime("%H:%M")}")
    "Text sent"
  end

private

  def delivery_time
    Time.new + 360
  end

end
