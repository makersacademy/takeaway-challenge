require 'twilio-ruby'


class TextOrder

  def initialize
    @account_sid = 'ACa7841a789acbfca82809d3388606513a'
    @auth_token = '3076bdc095ad7d8dadeb9d7d8bf7f840'
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @messages = []
  end

  def send_text(message)
    @messages << @client.messages.create(
                  from: '+441888272043',
                  to: '+447835039292',
                  body: message
                  )
    puts @messages.last.status
    return 
  end

end
