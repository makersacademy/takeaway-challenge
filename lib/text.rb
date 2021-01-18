require 'twilio-ruby'
require 'sinatra'

class Text

  attr_reader :client, :twilio_number

  def initialize
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send(number)
    @client.messages.create(
      from: @twilio_number,
      to: number,
      body: "Thanks for your order. Your delivery should arrive by #{Time.new.hour + 1}:#{Time.new.min}"
    )
  end


  def receive
    get '/' do
      "Hello World!"
    end
  end

end
