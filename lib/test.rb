require 'twilio-ruby'
require 'rubygems'

class Test


  @@account_sid = ENV['ACCOUNT_SID']
  @@auth_token = ENV['AUTH_TOKEN']

  def initialize
    @client = Twilio::REST::Client.new @@account_sid, @@auth_token
    # @msg_sid = 'MM123'
    @replies = []
    @all_texts = []
  end

  def text
    @client.messages.create(
    from: ENV['TWILIO_PHONE'],
    to: ENV['MY_PHONE'],
    body: 'hey there'
    )
  end

  def reply
    @client.messages.list.each do |message|
      @all_texts << message.body
    end
    @all_texts.each { |reply|
      @replies << reply unless reply.include? "Twilio trial"
    }
  end


  # def specific
  #   @msg = @client.messages.get('MM123')
  #   p @msg
  # end

end
