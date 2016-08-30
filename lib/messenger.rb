require 'twilio-ruby'

class Messenger

  def initialize
    @account_sid = 'ACce84b9f840f03f52cfd41806ed798dca'
    @auth_token = '9f6d5867dc9835739012b0afcd925325'
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    @message = {}
  end

  def set_message(from, to, body)
    @message = {:from => '+441346277066', :to => '+447756242388', :body => body}
  end

  def send_message
    @client.account.messages.create(@message)
  end



end
