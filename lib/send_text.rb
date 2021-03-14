# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
# THE BELOW WAS MY ATTEMPT TO CREATE A PROJECT SPECIFIC ENVIRONMENT BUT ....... WHO KNOWS!
# begin
#   require_relative '../.env.rb'
# rescue LoadError
#   TWILIO_ACCOUNT_SID = 'insert your SID'
#   TWILIO_AUTH_TOKEN = 'insert your token'
#   TWILIO_FROM = 'insert your Twilio number'
#   TWILIO_TO = 'insert the receiving number'
#   $no_TWILIO_loaded = true
# end

class SendText
  def initialize(clt = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKN']))
    # To set up environmental variables, see http://twil.io/secure
    @account_sid = ENV['TWILIO_ACCOUNT_SID'] # ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKN']
    @client = clt
    @from = ENV['TWILIO_FROM']
    @to = ENV['TWILIO_TO']
  end

  def send_confirmation(time, to = @to)
    message = "Thank you! Your order was placed and will be delivered by #{time}"

    begin
      @client.messages.create(
      from: @from,
      to: to,
      body: message
      )
    rescue Twilio::REST::RestError
      return message
    end
  end
end

send = SendText.new

send.send_confirmation('19:15')
