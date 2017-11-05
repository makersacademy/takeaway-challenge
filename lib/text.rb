require 'twilio-ruby'

class Text
  def initialize
    account_sid = 'AC914d197bc210e5c4be53a2773bdd7389'
    auth_token = '1e617d5c3d370e974cce57c04508e482'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @hour_later = (Time.now + 60 * 60).strftime('%H:%M')
  end

  def send_text
    @client.messages.create({
      :from => '+441591372009',
      :to => '+447775805779',
      :body => "Thank you! Your order was placed and will be delivered before #{@hour_later}"
      })
  end
end
