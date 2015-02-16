require 'rubygems' # not necessary with ruby 1.9 but included for completeness 
require 'twilio-ruby'
require './lib/order.rb'

class Checkout

  def initialize(money, total)
    @money = money
    @total = total
  end

def pay_money
  if @money != @total
    raise "You have entered an incorrect amount, please reenter"
  else
    puts "Thanks for your order! A text has been sent with your estimated delivery time."
  end
  send_message
end

 def delivery_time
  @hourahead = Time.new + 3600
 end
 
  def send_message
    delivery_time
    account_sid = 'ACb869fa6a0e0d8bcbca82368079985d07' 
    auth_token = '8ca316bf9c0c14d31739896ba2825085' 
     
    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token 
     
    @client.account.messages.create({
      :from => '+441412804334', 
      :to => '+447935294331', 
      :body => "Thanks for your order. Your cereal will be with you before #{delivery_time.strftime("%I:%M%p")}"  
    })
  end

end