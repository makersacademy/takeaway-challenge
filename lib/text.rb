require_relative 'details'

class Text

  include Details

  def send_text
    require 'twilio-ruby'

    account_sid = @id
    auth_token = @token
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = @from
    to = @to

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you for your order! Your food will arrive before #{Time.now + 1*60*60}"
    )
  end

end
