# require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
class TwilioClass

  ACCOUNT_SID = ENV['ACCOUNT_SID']
  AUTH_TOKEN = ENV['AUTH_TOKEN']

  def initialize(phone_number,receipt,total)
    @time_of_order = Time.new
    @receipt = receipt
    @total = total
    message_build
    send_message(phone_number)
  end

  def delivery_promise
    @delivery_promise = (@time_of_order + 3600).strftime("%H:%M")
  end

  def send_message(phone_number)
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

    @client.account.messages.create({
      from: '+441438300248',
      to: phone_number,
      body: @message,
    })
  end


  def message_build
    @message = "Hello customer! Your order for the following has been received: \n#{@receipt}The total of your order came to £#{@total} and it will be with you by #{delivery_promise}. Thank you for eating at Deon Dumplings, your favourite double Ds!"
  end

end