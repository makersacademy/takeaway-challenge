require 'twilio-ruby'

class Messenger

  def initialize(twilio = twilio_client)
    @client = twilio
    @my_phone = ENV['MY_PHONE']
  end

  def confirm
    @client.create({
      :from => '+441344567662',
      :to => @my_phone,
      :body => "Your order was placed and will be delivered before #{time}." })
  end

private

  def twilio_client
    require 'dotenv'
    Dotenv.load
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']

    client = Twilio::REST::Client.new account_sid, auth_token
    client.account.messages
  end

  def time
    (Time.now+(60*60)).strftime "%H:%M"
  end

end
