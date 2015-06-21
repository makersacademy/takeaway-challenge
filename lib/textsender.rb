require 'twilio-ruby'

class TextSender


  def initialize

    @client = Twilio::REST::Client.new ENV['account_sid'], ENV['auth_token']

  end


  def submit_text

    @client.messages.create(
    from: '+441242305328',
    to: '+447472301963',
    body: 'aarrfrfa'
    )

  end

end
