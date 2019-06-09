require_relative 'pierogi'

class Order

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add_to_order(dish)
    pierogi = Pierogi.new
    @basket << pierogi.pick(dish)
    nil
  end

  def show_basket
    @basket.map{|i| i.join(' - ')}.join(', ') 
  end

  def total
    sum_total = 0
    @basket.flatten.map do |i| 
      if i.is_a?(Integer) == true 
        sum_total += i 
      end
    end
    sum_total
  end
end