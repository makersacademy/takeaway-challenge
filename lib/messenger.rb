require 'twilio-ruby'

class Messenger

  def initialize
    require 'dotenv'
    Dotenv.load
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @my_phone = ENV['MY_PHONE']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def confirm

    @client.account.messages.create({
      :from => '+441344567662',
      :to => @my_phone,
      :body => "Your order was placed and will be delivered before #{time}." })
  end

  def time
    (Time.now+(60*60)).strftime "%H:%M"
  end

end
