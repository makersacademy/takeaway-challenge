require 'twilio-ruby'

class Reminder

  def send_msg(text)

    @account_sid = 'ACcfcd4b583188c4f2de642b2c3b956321'
    @auth_token  = '030d60038fb2840cf20971db3a693e14'
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)

    @client.messages.create(
    from: '+441412804523',
    to:   '+447398710678',
    body: text)

  end

end
