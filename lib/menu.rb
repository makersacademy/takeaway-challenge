class Menu
  def initialize
    @menu = {
      'Scrumbled eggs' => 4.99,
      'Roasted aubergine & tomato curry' => 5.60,
      'Jacket Potato with whipped feta' => 8.25,
      'Mushroom, ricotta & rocket tart' => 9.20,
      'Cod with beans & artichokes' => 11.40,
    }
  end

  def list
    @menu.each do |dish, price|
      puts "Dish: #{dish} - Price: #{price}"
    end
  end
end
