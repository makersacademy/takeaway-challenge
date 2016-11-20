require 'twilio-ruby'

class SMSSender

  def send_sms(message)
    account_sid = "ACdbd0b7d68c85ff8d0eba3d54846c8223"
    auth_token = "1f5b562d6ae3a16f303420d3aec7fd7d"

      @client = Twilio::REST::Client.new account_sid, auth_token
      @client.account.messages.create(:body => message,
            :to => "+447944749585",
            :from => "+441291606004")
  end

end
