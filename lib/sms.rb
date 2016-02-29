require 'twilio-ruby'

class SMS

  def send_text(message)
    # To find these visit https://www.twilio.com/user/account
    account_sid = 'AC6a148e32ec8f30dee711d136bce02b9d' 
    auth_token = '07fce4be2a6ac97a6c06f85ba6436d7c'
     
    begin
        @client = Twilio::REST::Client.new account_sid, auth_token
        @client.account.messages.create({
            :from => "+17633163431", 
            :to => "+16123081947",
            :body => message.to_s || "Hello!"
        })
    rescue Twilio::REST::RequestError => e
        puts e.message
    end
  end
end