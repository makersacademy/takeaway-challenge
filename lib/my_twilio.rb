require 'twilio-ruby'

module MyTwilio
  def client
    account_sid = 'AC1b1b112f26029e40d0ce0ce3a1ed13db'
    auth_token = '509ec97348dcdd4473594be3bb7583a5'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
  def dog

  end
end
