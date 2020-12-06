require_relative "takeaway"

class Checkout
  # attr_accessor :basket

  def initialize
    $basket = []
    @sum = 0
  end

  def total
    @sum = $basket.inject(0) { |sum, item| sum + item }
  end

  def payment
    @sum = @sum.round(2)
    puts "Your total is #{@sum}"
    puts "Write your total amount to purchase order"
    pay = gets.chomp.to_f
    if pay == @sum
      @complete_order
      # puts "Thank you for your purchase"

    else
      puts "Try again"
    end
  end

  def complete_order
    send_text("Thank you for your order: #{@totalorder}")
  end

  def send_text(message)
    # this method calls the Twilio API
  end
end
