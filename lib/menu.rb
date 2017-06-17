class Menu
  attr_reader :dishes

  def initialize
    create_menu
  end

  def create_menu
    @@dishes = { 'Kobe Slider' => 7,
                 'Shrimp Tempura' => 4,
                 'Salmon Teriyaki' => 5,
                 'Chicken Katsu' => 8,
                 'Edamame Pot' => 2 }
  end

  def read_menu
    @@dishes.each do |key, value|
      puts key + ": £" + value.to_s
    end
  end
end
