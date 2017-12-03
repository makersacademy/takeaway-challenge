require "order"

class Restaurant
  attr_reader :food

  def food
    @food = {
      "RUSTICA MARGHERITA": 9.45,
      "LENTIL RAGU": 8.95,
      "GREEN GODDESS BROCCOLI SALAD": 10.95,
      "SPAGHETTI POMODORO": 7.95
    }
  end

  def menu
    food.each do |dish, cost|
      puts "#{dish} : #{format("£%.2f", cost)}"
    end
  end


end
