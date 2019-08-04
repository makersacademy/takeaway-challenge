
class Order

  attr_reader :basket, :total_price

  def initialize(basket = [], total_price = 0)
    @basket = basket
    @total_price = total_price
  end

  def calculate_price
    @basket.each do |item|
      item.each { |_, value| @total_price += value }
    end
  end

  def basket_summary
    basket_text = []
    @basket.each do |item|
      item.each { |key, value| basket_text += ["#{key} = £#{value}"] }
    end
    basket_text
  end

end
