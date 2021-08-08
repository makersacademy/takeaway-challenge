require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class ConfirmationText

  current_time = Time.now
  delivery_time = (current_time + 3600).strftime("%H:%M")

  DEFAULT_FROM = ENV['FROM']
  DEFAULT_TO = ENV['TO']
  DEFAULT_BODY = "Thanks for your order! It will be with you by #{delivery_time}"


  def initialize(to=DEFAULT_TO, from=DEFAULT_FROM, body=DEFAULT_BODY)
    @to = to
    @from = from
    @body = body
  end

  account_sid = ENV['ACCOUNT_SID']
  auth_token = ENV['AUTH_TOKEN']
  $client = Twilio::REST::Client.new(account_sid, auth_token)
  
  def send_confirmation
    $client.messages.create(
    from: @from,
    to: @to,
    body: @body
    )
  end
  
end