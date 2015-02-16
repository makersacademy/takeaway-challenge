require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

class Assistant
   
  def take_order(order, customer, total)
    if total==order.order_total_cost
      confirm_order(customer)
    else
      puts "Sorry you inputted the wrong total cost, please try again."
    end           
  end  

  def confirm_order(customer)
    time=Time.new
    hour = time.strftime("%I").next
    minutes = time.strftime("%M")
    print_time = hour+':'+minutes
    puts "Thanks #{customer.name}, your order was placed and will be delivered at #{print_time}" 
  end  

end