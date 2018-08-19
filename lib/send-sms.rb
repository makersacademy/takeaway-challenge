# require 'bundler'
# Bundler.require()

require 'twilio-ruby'

  def send_sms
    account_sid = "AC9a38d2a7818f803e9c23ded219232787"
    auth_token = "1b70eae15d0b80dcf309a3475f52f3d6"

    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = "+447480486810"
    to = "+447838205185"

    client.messages.create(
      from: from,
      to: to,
      body: "Your delivery is on it's way!"
    )
  end
