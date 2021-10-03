require_relative 'checkout'

class Total
  attr_reader :selection, :checkout

  def initialize(checkout = Checkout.new)
    @selection = []
    @checkout = checkout
  end

  def bill
    sum = []
    selection.each do |item|
      sum << item[:price].to_f * item[:quantity]
    end
    sum.inject(:+)
  end

  def receipt
    puts "Your Receipt"
    selection.each do |item|
      puts "#{item[:dish]} - quantity:#{item[:quantity]} - £#{item[:price]}"
     end 
    puts "Total #{bill}"
  end

  def pay
    checkout.send_notification
  end
end
