require 'rubygems'
require 'twilio-ruby'

class TextAlert

  def initialize
    # @account_sid = # ADD ACCOUNT SID HERE
    # @auth_token = # ADD AUTH TOKEN HERE
    # @client = Twilio::REST::Client.new @account_sid, @auth_token
    # @from = # ADD TWILIO NUMBER HERE
    # @customer_number = # ADD CUSTOMER NUMBER HERE

    @account_sid = 'ACc432bc414067fc1d92cc2b94155eaab9'
    @auth_token = '42a694dd82361d5d0d88fbec21dbe8dd'
    @client = Twilio::REST::Client.new @account_sid, @auth_token

    @from = '+441438301049'
    @customer_number = '+447947731175'
  end

  def send_confirmation
    @client.api.account.messages.create(
      from: @from,
      to: @customer_number,
      body: "Thank you! Your order was placed and will be delivered before #{(Time.new + 3600).strftime("%-I:%M%P")}."
    )
  end

end
