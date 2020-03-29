require 'json'
require 'twilio-ruby'
class Texter
  # Download the twilio-ruby library from twilio.com/docs/libraries/ruby
  attr_reader :account_sid, :auth_token, :client, :customer_number, :texted_time, :from
  KEYCHAIN = './lib/API_stuff.JSON'
  KEY = File.read(KEYCHAIN)
  CREDENTIALS = JSON.parse(KEY)
  def initialize(num:, text_time:)
    @account_sid = CREDENTIALS["ACCOUNT_SID"]
    @auth_token = CREDENTIALS["AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @customer_number = num
    @texted_time = text_time
    @from = CREDENTIALS["TWILIO_NUMBER"]
    fix_time
  end

  def make_the_call
    unless @customer_number == nil
      @client.messages.create(
        from: @from,
        to: @customer_number,
        body: "Thanks for placing your order, it should be with you by #{@texted_time}"
      )
    end
  end
  def num_digits(num)
    Math.log10(num).to_i + 1
  end
  def fix_time
    digits = num_digits(@texted_time.min)
    @texted_time = digits == 1 ? "#{@texted_time.hour}:0#{@texted_time.min}" :"#{@texted_time.hour}: #{@texted_time.min}"
  end
end
