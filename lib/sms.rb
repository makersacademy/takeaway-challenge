require 'twilio-ruby'

class SMS
  def initialize(number)
    account_sid = 'AC06389294e20e72f37dfd4469ff5ad2f9'
    auth_token = '499b41a6ce32b602047a3fa465f27e6c'
    @number = number
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from = "+441599312016" #my twliio phone number
  end

  def send_message
    delivery_time = Time.now + (60*60)

    @client.account.messages.create(
      from: @from,
      to: @number,
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time.strftime("%H:%M")}"
    )
  end
end

# require 'twilio-ruby'
#
# # put your own credentials here
# account_sid = 'AC06389294e20e72f37dfd4469ff5ad2f9'
# auth_token = '499b41a6ce32b602047a3fa465f27e6c'
#
# # set up a client to talk to the Twilio REST API
# @client = Twilio::REST::Client.new account_sid, auth_token
#
# @client.account.messages.create(
#   from: '+441599312016',
#   to: '+447522253914',
#   body: 'Robot invasion! Reply back with any sightings.'
# )
