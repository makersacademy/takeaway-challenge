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
    @current_order.dup
  end

  def is_empty?
    @current_order.empty?
  end

  def total
    sum = 0
    @current_order.each do |item|
      sum += item[:quantity] * item[:price]
    end
    "Your total is £#{'%.2f' % sum}"
  end
end
