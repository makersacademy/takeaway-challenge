require_relative './menu.rb'
require_relative './text_sender.rb'

class Takeaway

  attr_reader :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
  end

  def show_menu
    @menu.display_menu
  end

  def place_order
    everything = false
    until everything
      puts "Enter item #"
      item_number = gets.chomp
      puts "Enter quantity"
      quantity = gets.chomp
      puts "Is that everything? (Y/n)"
      complete = gets.chomp
      (everything = true) if complete == "Y" 
      @order.push(@menu.select_item(item_number, quantity))
    end
    sms_confirmation
  end

  def guess_amount
    puts "How much do you think the order has come to?"
    @total_guess = gets.chomp
  end 

  def receipt
    total = @order.reduce(0) {|sum, item| sum + (item[0]["cost"] * item[1].to_f )}

    (@total_guess == total) ? (puts "You calculated the total correctly, the breakdown is...") 
                            : (puts "You calculated the total incorrectly, the breakdown is...")

    @order.each_with_index {|item, index| puts "#{index + 1}. #{item[0]["name"]} Price: #{item[0]["cost"]} Quantity: #{item[1]} Total: #{(item[0]["cost"] * item[1].to_f)}"}  
    puts "The final amount is: #{total}"
  end

  private

  def sms_confirmation
    TextSender.new(ENV["TWILIO_TO"], "Your order has been placed at #{Time.now.strftime("%H:%M:%S")}")
  end

end


