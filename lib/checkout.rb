
class Checkout
  def sumarise(food, prices)
    summary_string = ""
    food.each do |key, value|
      cost = prices[key] * value
      summary_string << "#{value}x #{key} = £#{cost}, "
    end
    summary_string.chomp(", ")
  end

  def total_price(food, prices)
  total = 0
  food.each { |key, value| total += prices[key] * value }
  total.round(2)
  end
end
