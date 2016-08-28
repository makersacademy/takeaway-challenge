#Understand the list of available dishes

class Menu

  attr_reader :dishes

  def initialize
    @dishes = { "chicken" => 5,
                "chips" => 2,
                "burger" => 5,
                "fish" => 5,
                "steak" => 6 }
  end

  def display_dishes
    dishes.each_with_index do |(key,value),index|
      puts "#{index +1}) #{key}:  #{value} "
    end
  end
end
