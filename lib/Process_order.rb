class Process_order
  attr_reader :want_to_order

  def initialize
    @want_to_order = false
  end

  def customer_ordering
    @want_to_order = true
  end

  def are_you_ordering(reply)
    customer_ordering if reply == true
  end
end
