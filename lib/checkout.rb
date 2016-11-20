class Checkout

attr_reader :total

def initialize
@total = 0
end

def view_basket(order)
  order.order.each{ |a| puts"#{a}" }
  order.order.each{ |a| @total += a[2] }
  puts
  puts"Your total bill is £#{@total}"
end


def pay
  puts "To pay your bill, please type in the total of #{@total}."
  payment = gets.chomp.to_f
  if payment == @total
    puts "PAID! Please come again!!"
  else
    puts "Wrong amount. No food for you."
  end
end


end
