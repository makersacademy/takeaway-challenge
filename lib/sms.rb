require 'rubygems'
require 'twilio-ruby'

class TakeawayText

  attr_reader :send_text

  def text_message customer_number, customer_order

    account_sid = 'AC01631940eedcf4cfcff8410e2b1e2687' 
    auth_token = '7823a0a25a351de12de0087a707b3fd1'
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.account.messages.create(:body => "Your order has been received. Our chefs are busy preparing your order for delivery.",
    :to => "++447910072627",
    :from => '+441143599394')

  end

end