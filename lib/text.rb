require 'twilio-ruby'

class Text


  def initialize
    account_sid = 'AC9bc4be7b933cfb2b94b756dbfe0ad930'
    auth_token = 'fed92318d72ef7a953103d59f79ae29f'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send
    @client.account.messages.create({
      :from => '+441292388059',
      :to => '+4407426033051',
      :body => message})
  end

private
  def message
    "Your order will be delivered before #{delivery_time}"
  end

  def delivery_time
    time = (Time.now + (60*60)).strftime("%H:%M")
  end
end
