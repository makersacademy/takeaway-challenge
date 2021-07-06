class Menu
  attr_reader :dishes
  def initialize
    @dishes = [
      { "1. Vegetable Ramen" => 5 },
      { "2. Crispy Tofu" => 3, },
      { "3. Egg-fried Rice" => 3, },
      { "4. Chilli Prawns" => 6 }
    ]
  end

  def display
    @dishes.each do |menu|
        menu.each do |item, value|
        puts "#{item}: £#{value}"
      end
    end
  end

end