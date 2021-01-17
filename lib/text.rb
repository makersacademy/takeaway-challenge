require 'twilio-ruby'

class Text
  def initialize
    account_sid = 'AC09d3e014be8ae7205826bf382f695497'
    auth_token = '1488bd774621678f93548386cbef25fe'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @from = '+17734928791'
    @to = '+447951723723'
  end

  def send_text
    @client.messages.create(
      from: @from,
      to: @to,
      body: "Thank you! Your order was placed and will be delivered before #{(Time.now + 4000).strftime('%I:%M %p')}"
    )
  end
end
