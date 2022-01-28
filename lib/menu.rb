class Menu

  attr_reader :dishes

  def initialize
    @dishes = { "Pizza" => "7.99", "Chips" => "1.50", "Burger" => "4.99" }
  end

  def print_dishes
    @dishes.each do |food, price|
      puts "#{food}: £#{price}"
    end
  end

end
