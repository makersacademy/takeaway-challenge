class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
      Koreanbbq: 10,
      Burger: 7,
      KFC: 7,
      Sushi: 10,
      Ribs: 8
    }
  end

  def introduction
    "Welcome to MA Takeaway. Please order from our tasty selection of dishes!"
  end

  def show_menu
    @dishes.collect { |key, value| puts "#{key}       £#{value}".center(30)}
  end

end
