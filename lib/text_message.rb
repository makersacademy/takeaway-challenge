require 'twilio-ruby'

class TextMessage

  def send_text
    account_sid = 'AC12a59e4042ac55f25c465b4ca8a782a7'
    auth_token = 'f0f830342f1b6d9b68e5ab43461e58c4'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
      from: '+441621710089',
      to: '+447842397435',
      body: 'Robot invasion! Reply back with any sightings.'
    )
  end

end
