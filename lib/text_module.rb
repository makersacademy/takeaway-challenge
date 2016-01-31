require 'twilio-ruby'

module Text

  def initialize
    account_sid = "ACb317af848af7853745abacca58a4aa95"
    auth_token = "6ddd28b7dafddf0cdc366f38589dbca0"
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def text
    @client.messages.create(
    from: '+441503505018',
    to: '+447450946912',
    body: "Thanks for your order! It's on its way and should be with you by " + (Time.new + 3600).to_s[11..15] + "!"
    )
  end

end
