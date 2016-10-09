class Text
  require 'twilio-ruby' # put your own credentials here

  ACCOUNT_SID = 'AC7f7a892da0371e37f6014607c42a7faa'
  AUTH_TOKEN = 'd0ba1b636c9917d3e7fe1587088d2511'

  attr_reader :to, :from, :message

  def initialize(message,to ='+447598776122',from ='+441143032749')
    @from = from
    @to = to
    @message = message
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
  end

  def send
    @client.account.messages.create({
      :to => @to,
      :from => @from,
      :body => @message,
    })
  end

end
