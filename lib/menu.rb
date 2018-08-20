class Menu

  attr_reader :menu_hash

  def initialize
    @menu_hash = {
      "Chicken Tikka Masala": 4.25,
      "Chicken Tikka Balti": 5.75,
      "Chicken Dhansak": 5.15,
      "Chicken Saagwala": 4.75,
      "Tandooi Chicken": 6.25
    }
  end

  def display_menu
    puts "----------- Menu ------------"
    @menu_hash.each { |key, value| puts "#{key} \t #{value}" }
    puts "-----------------------------"
  end


  
end
