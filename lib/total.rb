require_relative 'current_order'

class Total

  attr_reader :total, :current_order, :subtotal

  def initialize
    $total = 0
    @subtotal = []
  end

  def calculate_total
    $current_order.each { | plate | @subtotal << plate[:price]}
    $total = @subtotal.inject(:+)
  end

end
