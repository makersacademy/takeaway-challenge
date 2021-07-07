class Basket
  attr_accessor :current_order
  def initialize
    @current_order = []
  end
  
  def total
    total = 0
    @current_order.each { |item| total += (item[:price].to_f * item[:quantity]) }
    '%.2f' % total
  end
end
