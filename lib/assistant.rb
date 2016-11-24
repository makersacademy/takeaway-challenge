require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

class Assistant
   
  def confirm_order(customer)
    time=Time.new
    hour = time.strftime("%I").next
    minutes = time.strftime("%M")
    print_time = hour+':'+minutes
    puts "Thanks #{customer.name}, your order was placed and will be delivered at #{print_time}" 
  end  

end
