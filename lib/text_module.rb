require 'twilio-ruby'

module Text

  def initialize
    account_sid = "ACb317af848af7853745abacca58a4aa95"
    auth_token = "6ddd28b7dafddf0cdc366f38589dbca0"
    @client = Twilio::REST::Client.new account_sid, auth_token
  end



end
