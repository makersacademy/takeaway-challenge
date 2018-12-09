require 'twilio-ruby'

class SMS

  def initialize(time, number = '+447886730967')
    @time = time
    @number = number
  end

  def send_confirmation
    account_sid = 'ACf47ec49d1e9bf5a1fc53f72a705c2407'
    auth_token = '94dfb77bd336226f365e4bd53c9c2436'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441212857910' # Your Twilio number
    to = @number # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order will be delivered by #{@time}"
    )
  end

end
