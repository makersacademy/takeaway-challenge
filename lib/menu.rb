class Menu
  attr_reader :menu

  def initialize
    @menu = {
    sushi: 1,
    burger: 2,
    pizza: 3
    }
  end

  def show
    @menu.each { |food, price| puts "#{food}: £#{price}" } 
  end
end
