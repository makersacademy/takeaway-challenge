require 'rubygems'
require 'twilio-ruby'

class TextAlert

  def initialize
    @account_sid = # ADD ACCOUNT SID HERE
    @auth_token = # ADD AUTH TOKEN HERE
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    @from = # ADD TWILIO NUMBER HERE
    @customer_number = # ADD CUSTOMER NUMBER HERE
  end

  def send_confirmation
    @client.api.account.messages.create(
      from: @from,
      to: @customer_number,
      body: "Thank you! Your order was placed and will be delivered before #{(Time.new + 3600).strftime("%-I:%M%P")}."
    )
  end

end
