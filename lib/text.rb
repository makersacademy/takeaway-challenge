require 'rubygems' 
require 'twilio-ruby' 

class Text 
  attr_reader :message 

  def initialize
    @message = "Thank you! Your order was placed and will be delivered before #{Time.new + 3600}"
    # account_sid = 'AC0b85be1823fd320757517dcd1ef3dae2' 
    # auth_token = '[AuthToken]' 
    # @client = Twilio::REST::Client.new(account_sid, auth_token) 
  end

  def confirm_order
    "#{@message}"
  end 

end
