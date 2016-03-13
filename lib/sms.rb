require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load
class Sms
  def initialize(account_sid = ENV['SID'],
                 auth_token = ENV['TOKEN'])
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def message(total)
    @total = total
    calculate_waiting
    send "Order total: £#{total}. #{name} is preparing your order."\
    " Estimated delivery: #{calculate_waiting}."
  end

  def send(text)
    @client.messages.create(
      from: ENV['FROM'],
      to: ENV['MY_NUM'],
      body: text
    )
  end

  private

  def name
    names = %w(Andrew Adil Anne Caspar Chris Claudia Erika
               Gabrielle Han Phoebe Harsheet Jazzy Joj
               Junyuan Kevin Kyle Lorenzo Patrick Misa
               Nick Oliver Paul Pete Rhiannon Sachin
               Shane Simon Tobenna Yasmin)
    names.sample
  end

  def calculate_waiting
    t = Time.new + rand(600..3600)
    @time = t.strftime('%H:%M')
  end
end
