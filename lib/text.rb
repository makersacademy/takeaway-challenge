module Text

  def send_text
     account_sid = 'ACef87d7dfc16f3cebd55fc9ec9969335a'
     auth_token = '720f3dadd2aaa05bd816b43b5bd99059'
     @client = Twilio::REST::Client.new account_sid, auth_token
     message = @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered within the next hour",
     :to => "+447706910776",
     :from => "+441270261008")
   end

end
