require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Messager

  TWILIO_NUMBER, CUSTOMER_NUMBER = ENV['TWILIO_NUMBER'], ENV['CUSTOMER_NUMBER']

  def initialize
    @client = Twilio::REST::Client.new ENV['account_sid'], ENV['auth_token']
    @number = CUSTOMER_NUMBER
  end

  def enter_tel_no(number)
    number = number.tr(" ","")
    number[0] = '' if number[0] == "0"
    raise 'invalid number' unless number.match(/\d{10}/)
    @number = "++44" + number
  end

  def send_text(message, customer_telephone_no = @number)
    @client.messages.create({
      :from => TWILIO_NUMBER,
      :to => customer_telephone_no,
      :body => message,
    })
  end

end
