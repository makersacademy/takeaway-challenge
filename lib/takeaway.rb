class Takeaway
  attr_reader :food, :basket

  def initialize
    @food = food
    @basket = []
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

  def choose_menu
    puts "Choose food: "
    user = gets.chomp

    if user == "chips"
      @basket << 5.50
    elsif user == "wings"
      @basket << 7.20
    elsif user == "burger"
      @basket << 8.50
    end
  end
  
end
