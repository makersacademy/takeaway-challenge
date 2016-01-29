require 'twilio-ruby'
require 'rubygems'

class Test

  @@account_sid = 'ACa017c4d8a2611154a0f08f692e71ff37'
  @@auth_token = '90e883e4f42336bcc377f4a14afb11ff'

  def initialize
    @client = Twilio::REST::Client.new @@account_sid, @@auth_token
    # @msg_sid = 'MM123'
    @replies = []
  end

  def text
    @client.messages.create(
    from: '+441922214133',
    to: '+447780469088',
    body: 'hey there'
    )
  end

  def reply(choice)
    @client.messages.list.each do |message|
      @replies << message.body
    end
    p @replies[choice]
  end


  # def specific
  #   @msg = @client.messages.get('MM123')
  #   p @msg
  # end

end
