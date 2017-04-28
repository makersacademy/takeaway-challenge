require 'twilio-ruby'

class Confirmation

  def message
    account_sid = 'AC2f2cc3a91af3e3348d68930a1e4e575e'
    auth_token = '82e29d57d28323a1e2d09a78b50f4b28'
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.messages.create(
      from: "+441721272049",
      to: "+447872485113",
      body: "Thank you! Your order was placed and will be delivered before 18:52"
      )

    puts "Message sent to customer"
  end
end
