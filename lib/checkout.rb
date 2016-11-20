require_relative 'mms_messages.rb'

class Checkout

attr_reader :total

def initialize
@order
@total = 0
@confirmation_message = MessageSender.new
end

def set_order(order)
  @order = order
end

def view_basket
  #@order.order.each{ |a| puts"#{a}" } - Not required as the order shows when ordering.
  @order.order.each{ |a| @total += a[2] }
  puts
  puts"Your total bill is £#{@total}"
end


def pay
  puts "To pay your bill, please type in the total of #{@total}."
  payment = gets.chomp.to_f
  if payment == @total
    puts "PAID! Please come again!!"
    @confirmation_message.send_message("+447966155030", "Thank you! Your order was placed and will be delivered by #{delivery_time}")
  else
    raise "Error: Wrong amount. No food for you."
  end
end



def delivery_time
  hour = Time.new.hour + 1
  min = Time.new.min
  min = "0#{min}" if min < 10
  "#{hour}:#{min}"
end


end
