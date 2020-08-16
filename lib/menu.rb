class Menu

attr_reader :dishes

  def initialize
    @dishes = { "Pizza" => 8, "Chicken wings" => 5, "Chips" => 2, "Battered cod" => 6, "Cheeseburger" => 4, "Veggie burger" => 4 }
  end

  def view_dishes
    @dishes.each do |item, price|
      puts "#{item}: £#{price}"
    end
  end

end
