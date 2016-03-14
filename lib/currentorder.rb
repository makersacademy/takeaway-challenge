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
    @current_order.each do |hash|
      hash.each do |key,value|
        @total += value
        key + " cost: " + value.to_s
      end
      @total
    end
  end


end
