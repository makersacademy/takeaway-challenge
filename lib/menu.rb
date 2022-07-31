class Menu
  attr_reader :items


  def initialize 
    @items = {
      "1. Burger" => 5, "2. Fish" => 7, "3. Chips" => 2, "4. Chicken wings" => 3
    }
  end

  def display
   @items.each { |food, price| puts "#{food} £#{price}"}
  end
end