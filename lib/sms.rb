require 'twilio-ruby'
class Sms


  def send_text(message)
    account_sid = 'ACd44dda7420b82fa1b3e447079ac40f41'
    auth_token = '4a93466e921dca9b506c831fa4dbb12f'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create(
      :from => '+441143032721',
      :to => '+447812993202',
      :body => message)
  end


end
