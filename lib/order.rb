require_relative 'takeaway'

class Order

  attr_reader :check_total
  attr_reader :pay
  attr_reader :place

  def initialize
  end

  def pay price
    fail "Sorry, you need to pay the exact total, which is #{@total_cost}"
  end

  def place
  end



end