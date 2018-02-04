require 'twilio-ruby'
require 'bundler'

Bundler.require()

class Order
  def send_sms(message_body)
    account_sid = "AC9f87b9e0a7c45431cbb48726a53b9637"
    auth_token = "1cdf8a1d4d9a3e8f1a38ae702597e386"
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
        body: message_body,
        to: "+447888334605",
        from: "+441158245401")
  end
end
