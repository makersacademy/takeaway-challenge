require 'twilio-ruby'
#require 'rubygems'

class Text


  @@account_sid = ENV['ACCOUNT_SID']
  @@auth_token = ENV['AUTH_TOKEN']

  def initialize(client = Twilio::REST::Client.new(@@account_sid, @@auth_token))
    @client = client
  end

  def send_text(message)
    @client.messages.create(
    from: ENV['TWILIO_PHONE'],
    to: ENV['MY_PHONE'],
    body: message
    )
    message
  end

  def reply
    @replies = []
    @all_texts = []
    @all_texts = import_from_twilio
    extract_incoming_messages
    @replies
  end

  def new_message
    reply
    @replies[0].downcase.clone
  end

  private
  def import_from_twilio
    @client.messages.list.each do |message|
      @all_texts << message.body
    end
    @all_texts
  end

  def extract_incoming_messages
    @all_texts.each do |reply|
      @replies << reply unless reply.include? "Twilio trial"
    end
  end


end
