class Menu

  attr_reader :dishes, :seleted_dishes

  def initialize
    @dishes = { "Pizza" => "7.99", "Chips" => "1.50", "Burger" => "4.99" }
    @basket = []
  end

  def print_dishes
    @dishes.each do |food, price|
      puts "#{food}: £#{price}"
    end
  end

  def order(*choices)
    choices.select do |choices|  
      dishes.select { |food, price| food == choices }
    end
end
end
