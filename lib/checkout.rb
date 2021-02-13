require_relative './takeaway.rb'

class Checkout
  attr_reader :total
  def initialize(checkout_total = 0)
    @total = checkout_total
  end

  def final_total
    puts "£#{@total}0"
  end


end
