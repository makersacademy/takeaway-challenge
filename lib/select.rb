require_relative 'dishes'

class Select
  attr_reader :menu, :basket

  def initialize(menu = Dishes.new)
    @menu = menu
    @basket = Hash.new
  end

  def order(item, quantity)
    @basket.store( :item, quantity)
  end

  def order_overview
    @basket.each do |item|
      puts "#{item[:item]}: #{item[:price]}"
      @order_total += item[:price]
    end
  end
end
