class Cart
  def initialize
    @current_order = Array.new
  end

  def in_cart?(dish)
    @current_order.dup.include?(dish)
  end

  def add(dish)
    @current_order << dish
  end

  def check
    return @current_order.dup
  end

  def total
    
  end
end
