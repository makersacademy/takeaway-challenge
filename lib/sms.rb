require 'twilio-ruby'

class Sms
  def order_confirmation
    # account_sid = "AC9cbe834cb7d3797afe4bd7518ef3d1f8"
    # auth_token = "ff765c0b821d5b80e2b73b4bcfdbe1f6"
    #
    # @client = Twilio::REST::Client.new(account_sid, auth_token)
    #
    # @client.api.account.messages.create(
    #   to: "+447549420236",
    #   from: ENV["TWILIO_NUMBER"],
    #   body: "Your order has been received. it will arrive at #{Time.now + 60}"
    # )
    'hello'
  end
end
