require_relative 'dishes'

class Select
  attr_reader :menu, :basket, :quantity, :total

  def initialize(menu = Dishes.new)
    @menu = menu
    @basket = Hash.new
    @total = 0
  end

  def order(item, quantity = 1)
    # @basket.store(:item, quantity)
    @basket[item] += quantity
  end

  # def order_overview
  #   @basket.each do |k,v|
  #   end 
  # end
end
