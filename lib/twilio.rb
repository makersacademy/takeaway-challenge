require 'rubygems' # not necessary with ruby 1.9 but included for completeness
#require 'twilio-ruby'
require_relative 'customer'

class Twilio
  def timer
    date = Time.now + (3600)
    delivery_time = date.to_s.split(' ')[1]
  end
end
# 
# def send_text(name, phone)
#   account_sid = 'AC2f4d6a3fb2fcdd3e058b6930b7f47697'
#   auth_token = '18a596c4b02371cb565004ab54694bcf'
#   @client = Twilio::REST::Client.new account_sid, auth_token
#
#   message = @client.account.messages.create(
#   :body => "#{name}Your food is on its way! It will be there by #{Twilio.timer}" ,
#   :to => phone,     # Replace with your phone number
#   :from => '+441767512044')   # Replace with your Twilio number
#   puts "#{name}, we just sent you a text! Food will be there by #{Twilio.timer}!"
# end
