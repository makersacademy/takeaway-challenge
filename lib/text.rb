require "twilio-ruby"

class Text

  def initialize
    @account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxx'
    @auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyy'
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)

    @from = '+15551234567' # Your Twilio number
    @to = '+15555555555' # Your mobile phone number
  end

  def send_text(str)
    #@client.messages.create(from: @from, to: @to, body: str)
    p str
  end

  def show_all_texts
    #@client.api.account.messages.list
  end

end
