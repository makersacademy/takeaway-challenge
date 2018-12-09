
require 'twilio-ruby'

module SendTexts
# time = (Time.now + (60 * 60)).strftime("%k:%M")
# Commnted out to keep as example of time usage.

  def send_text(text)
    account_sid = 'AC075335083d586d923150458c33d95328'
    auth_token = '39f52498a7ce5aeda96628210b718380'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441233801132' # Your Twilio number
    to = '+447413527942' # Your mobile phone number

    client.messages.create(
      from: from,
      to: to,
      body: text
    )
  end
end
