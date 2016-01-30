#require 'twilio-ruby'
#require 'rubygems'

class Text


  @@account_sid = ENV['ACCOUNT_SID']
  @@auth_token = ENV['AUTH_TOKEN']

  def initialize
    @client = Twilio::REST::Client.new @@account_sid, @@auth_token
  end

  def text(message)
    @client.messages.create(
    from: ENV['TWILIO_PHONE'],
    to: ENV['MY_PHONE'],
    body: message
    )
  end

  def reply
    @replies = []
    @all_texts = []
    @client.messages.list.each do |message|
      @all_texts << message.body
    end
    @all_texts.each { |reply|
      @replies << reply unless reply.include? "Twilio trial"
    }
    @replies
  end

  def new_message
    reply
    @replies[0].downcase
  end


end
