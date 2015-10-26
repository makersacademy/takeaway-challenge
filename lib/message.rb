require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'


module Message

  def send_message
    # put your own credentials here
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => '+447983604913',
      :to => '+447983604913',
      :body => message,
    })
  end

  def message
    "Thank you! Your order was placed and will be delivered at #{delivery_time}."
  end

  def delivery_time
    time_now = Time.new
  end

end
