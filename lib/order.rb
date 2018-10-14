require_relative 'menu'

class Order

  attr_reader :order, :item_selected, :sum, :total

  def initialize
    @order = []
  end

  def add(item_selected)
    @inidividual_prices = []
    @order << item_selected
  end

  def delete(item_number)
    @inidividual_prices = []
    @order.each do |item|
      item.each do |dish, _price|
        $number = dish.split(" ")[0].to_i
      end
      @order.delete(item) if $number == item_number
    end
  end

  def sum_total
    @order.map do |item|
      item.each do |dish, _price|
        @inidividual_prices << item[dish]
      end
    end
    @total = @inidividual_prices.reduce(:+)
  end

end
