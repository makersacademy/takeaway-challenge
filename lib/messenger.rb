require 'twilio-ruby'

class Messenger

  ACCOUNT_SID = 'AC2d9d44552b5415638489da2b5fb7076d'
  AUTH_TOKEN = '829a272518bdfffafc0ed2de747e52b4'
  TIME = Time.now + 1800
  TEXT = "Thank you! Your order was placed and will be delivered before #{TIME.strftime("%k:%M")}"

  def send_text(message = TEXT)
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

    @client.account.messages.create({
      :from => '+442476100682',
      :to => '+447490442155',
      :body => TEXT,
    })
  end

end
