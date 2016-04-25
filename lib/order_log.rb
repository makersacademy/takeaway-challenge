#require_relative 'order'
#require_relative 'pizza'
require_relative 'message'
class OrderLog

  def initialize message = Message.new
    @log = []
    @total = 0
    @grand_total = 0
    @message = message
  end

  def order menu
    user_input = nil
    until user_input == 'n'
      puts "Enter Item Number"
      item_number = gets.chomp.to_i
      puts "Enter Quantity"
      item_quantity = gets.chomp.to_i
      order = menu[item_number][0], item_quantity
      total = menu[item_number][1] * item_quantity
      @log << [order, total]
      puts "You've ordered #{item_quantity} #{menu[item_number][0]}s"
      puts
      puts "Would You Like To Order Anything Else? y/n "
      user_input = gets.chomp
    end
  end

  def log
    line_adj = 25
    puts
    puts "***CURRENT ORDER***".center(line_adj * 1.5)
    puts "ITEM".ljust(line_adj/2) + "QUANTITY".center(line_adj) + "TOTAL".rjust(line_adj/2)
    @log.each do |item, total|
      @total += total
      @grand_total = @total
      puts item[0].ljust(line_adj/2) + item[1].to_s.center(line_adj) + "£#{total}".rjust(line_adj/2)
    end
    @total = 0
    puts
    puts "GRAND TOTAL: £#{@grand_total}".center(line_adj * 1.5)
    puts
  end

  def check_out
    puts
    puts "CASH UPON DELIVERY"
    puts "Your TOTAL is £#{@grand_total}"
    puts "Would you like to Check Out? y/n"
    if gets.chomp == "y"
      puts
      puts "YOUR ORDER WAS SUCCESSFULLY PLACED"
      puts "AN SMS WILL BE SENT TO MY OWN PHONE"
      puts
      @message.send
      self.clear
    end
  end

  def clear
    @log.clear
    @grand_total = 0
    puts "Your Order has been Cleared"
    puts
  end
end
