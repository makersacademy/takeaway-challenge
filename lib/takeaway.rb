class Takeaway
  attr_reader :food
  
  def initialize
    @food = food
  end

  def food_prices

    @food = {
      "chips" => 5.50,
      "wings" => 7.20,
      "burger" => 8.50
    }

    @food.each do |key, value|
      puts "#{key}: £#{value}"
    end
  
  end

end
