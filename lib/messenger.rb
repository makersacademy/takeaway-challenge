class Messenger

  require 'twilio-ruby'
  require 'dotenv'
  Dotenv.load

  def send_confirmation(message)

    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.messages.create({
      :from => ENV['FROM'],
      :to => ENV['TO'],
      :body => message,
    })

    puts "Confirmation has been sent"
  end

end
