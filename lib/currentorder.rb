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

  def order_review
    menu_summary
    puts "Total: " + @total.to_s
  end

private

  def menu_summary
    @current_order.each do |hash|
      hash.each do |key,value|
        @total += value
        p key + " cost: " + value.to_s
      end
    end
  end

end
