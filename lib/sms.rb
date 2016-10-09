require "twilio-ruby"
require "envyable"

class SMS

  def initialize(text, number_to)
    Envyable.load('./config/env.yml', 'dev')

    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token  = ENV['TWILIO_AUTH_TOKEN']
    @our_number  = ENV['OUR_PHONE_NUMBER']

    @text = text
    @number_to = number_to
  end

  def env_loaded?
    !@account_sid.nil? && !@auth_token.nil? && !@our_number.nil?
  end

  def send_sms
    client = Twilio::REST::Client.new @account_sid, @auth_token

    params = {:body => @text, :to => @number_to, :from => @our_number }
    client.account.messages.create(params)
  end
end
