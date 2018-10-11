class Dishes
  
  def initialize
    @dishes = { "Pizza" => 10, "Cheese_burger" => 5, "Chicken_Strips" => 4, "Garlic_Bread" => 3, "Fries" => 2 }
  end

  def print(dishes)
    index = 1
    @dishes.each do |key, value|
      puts "#{index}  #{key}           #{value}"
      index +=1
    end
  end

end