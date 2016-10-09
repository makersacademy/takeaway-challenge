class Text
  require 'twilio-ruby'

  attr_reader :to, :from, :message

  def initialize(message, credentials, to ='+447598776122')
    @from = credentials.sender
    @to = to
    @message = message
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new credentials.acc_sid, credentials.auth_token
  end

  def send
    @client.account.messages.create({
      :to => @to,
      :from => @from,
      :body => @message,
    })
  end

end
