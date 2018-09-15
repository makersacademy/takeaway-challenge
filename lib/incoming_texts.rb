require 'twilio-ruby'
require 'sinatra'

class SMSOrderInterpreter

  def initialize(text_api: Twilio::TwiML::MessagingResponse)
    @text_api = text_api
  end

  def run_server
    get '/sms-takeaway-order' do
      body = params['Body'].downcase
      twiml = @text_api.new do |r|
        r.message(body: body.count("\n"))
      end

      twiml.to_s
    end
  end

  def parse_order(text)
  end

  def confirm_order(text)
  end

  def help
    puts "Texts should be sent in the format [dish name]: [quantity] followed by a new line."
  end
end
