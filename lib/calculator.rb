require_relative 'customer'


class Calculator

  attr_reader :ordered_total

  def initialize
    @ordered_total = ordered_total
  end

  
  def order_total ordered
    @ordered_total.ordered #Not sure how to bring in order info
  end

end


