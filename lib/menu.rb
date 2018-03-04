class Menu
  attr_reader :dishes
  def initialize
    @dishes = {
      "Chicken Korma" => 10,
      "Pulled Pork" => 9,
      "Cheesecake" => 6,
      "Katsu Curry" => 11,
      "Donuts" => 4
    }
  end

  def show_menu
    @dishes.each { |k, v| puts "#{k}: #{v}" }
  end
end
