class Dishes
  
  def initialize
    @menu = {
      "Pizza"           => 10,
      "Cheese_burger"   => 5,
      "Chicken_Strips"  => 4,
      "Garlic_Bread"    => 3,
      "Fries"           => 2
    }
  end

  def display
    index = 1
    puts "'Go-Away' - Take-Away Menu".center(50)
    @menu.each do |key, value|
      puts "Number: #{index}".center(50)
      puts "#{key}".center(50)
      puts "Price: £#{value}".center(50)
      puts "-----".center(50)
      index +=1
    end
  end

end