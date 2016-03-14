require_relative 'order'

class CurrentOrder

  attr_reader :current_order

  def initialize
    @current_order = []
    @total = 0
  end

  def new_item(order)
    @current_order << order
  end

  def current_order
    @current_order
  end

  def order_review
    cost_breakdown
    current_total
  end


private

  def current_total
    puts 'Total order cost: ' + @total.to_s
  end

  def cost_breakdown
    @current_order.each do |hash|
      hash.each do |key,value|
      @total += value
      puts  key.capitalize + " cost: " + value.to_s
      end
    end
  end

end
