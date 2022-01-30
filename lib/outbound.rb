require_relative 'takeaway'

require("bundler")
Bundler.require()
require "twilio-ruby"

class Confirmation

  def number
    puts "please enter your number"
    number = gets.chomp
    
    if number.start_with?('0')
      number[0] = '+44'
    end
    return number
  end

  def sms(body)
<<<<<<< HEAD:lib/outbound.rb
    account_sid = "it is a secret ;)"
    auth_token = "this too is a secret ;)"
=======
    #CONVERT TO ENVIRONMENT VARIABLES BEFORE PUSHING
    account_sid = ""
    auth_token = ""
>>>>>>> 06c6a0b253cf7719afb698cc278dba3d1d1d91c4:lib/twilio.rb

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(
      to: number(),
      from: '+17853699411',
      body: body
    )
  end
end

takeaway = Takeaway.new
confirm_order = Confirmation.new

puts takeaway.list
takeaway.select

confirm_order.sms(takeaway.total)
