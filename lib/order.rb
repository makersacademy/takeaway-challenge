
class Order

  attr_reader :basket, :total_price

  def initialize
    @basket = []
    @total_price = 0
  end

  def calculate_price
    @basket.each do |item|
      item.each { |_, value| @total_price += value }
    end
  end

end
