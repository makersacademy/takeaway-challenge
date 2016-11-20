require 'twilio-ruby'

class SMS

  def send_sms(message)

    account_sid = 'AC839344f8069f9e1e8f960c1bd8c2710f'
    auth_token = 'b59bcffa4b7681207e7ad15c2e272560'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
      :from => '+442033224884',
      :to => '+447807833267',
      :body => message
    )

  end

end
