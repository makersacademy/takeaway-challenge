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
      :body => 'Thank you! Your order was placed and will be delivered before 18:52')
    "Text sent"
  end
end
