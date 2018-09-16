class Menu
  attr_reader :prices

  def initialize
    @prices = {
    sushi: 1,
    burger: 2,
    pizza: 3
    }
  end

  def show
    @prices.each { |food, price| puts "#{food}: £#{price}" } 
  end
end
