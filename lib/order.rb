require_relative 'menu'

class Order

  attr_reader :order, :item_selected, :sum, :total

  def initialize
    @order = []
  end

  def add(item_selected)
    @sum = []
    @order << item_selected
  end

  def delete(item_number)
    @sum = []
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
        @sum << item[dish]
      end
    end
    @total = @sum.reduce(:+)
  end

end
