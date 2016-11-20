require 'twilio-ruby'

class TextMessage

  def send_confirmation_message
      account_sid = 'AC67d844371c22707a83ad774108a96baa'
      auth_token = '7e46416bd95a3022862a9a4180eec824'

      @client = Twilio::REST::Client.new account_sid, auth_token
      message = @client.account.messages.create(:body =>
      "Thank you! Your order was placed and will be
      # delivered before #{Time.now + (60 * 60)} ",
          :to => "+447816222149",
          :from => "+441290366011")

  end

end
