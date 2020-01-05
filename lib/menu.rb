class Menu

  attr_reader :dishes

  DISHES = {
      "Egg fried rice" => 3,
      "Sweet & sour fish" => 6,
      "Morning glory" => 4 }

  def initialize(dishes = DISHES)
    @dishes = dishes
  end

  def view
    n = 1
    @dishes.each do |dish, price|
      puts "#{n}. #{dish}: £#{price}"
      n += 1
    end
  end
end
