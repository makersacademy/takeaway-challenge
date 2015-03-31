require 'twilio-ruby'

class Restaurant

  attr_reader :menu

  def initialize
    @menu = {
      sandwich:   5,
      pasta:      6,
    }
  end

 def check_order(line_items, grand_total)
   checkout = line_items.map { |item| menu[item] }.reduce(:+)
   # reduce method is similar to the inject method
   # when you have a collection of items and you just want one, use inject/reduce
   if checkout == grand_total
     send_sms
     true
   else
     raise "Incorrect total sum"
   end
 end

  def send_sms
    time = Time.new + 1000
    @account_sid = "AC818acf3033d7d4f21925e84cbc44a16c"
    @auth_token = "c128f93326260d565c0921d7820b6431"
    @from_number  = +441480706118
    @to_number    = +4407429088631 
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @account = @client.account
    @sms = @account.messages.create({
      :from => @from_number,
      :to => @to_number,
      :body => "Thank you! Your order was placed and will be delivered before #{time}"})
    p @sms
  end
end
