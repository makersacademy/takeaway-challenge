
class Checkout
  def sumarise(food, prices)
    summary_string = ""
    food.each do |key, value|
      cost = prices[key] * value
      summary_string << "#{value}x #{key} = £#{cost}, "
    end
    summary_string.chomp(", ")
  end
end
