class Menu
  def initialize
    @menu = {
      'Nutella on rice cakes and banana on top' => 3,
      'Scrumbled eggs' => 4.99,
      'Roasted aubergine & tomato curry' => 5.60,
      'Jacket Potato with whipped feta' => 8.25,
      'Mushroom, ricotta & rocket tart' => 9.20,
      'Cod with beans & artichokes' => 11.40,
    }
  end

  def list
    @item_n = 1

    @menu.each do |dish, price|
      puts "#{@item_n}. Dish: #{dish} - Price: #{price}"
      @item_n += 1
    end
  end
end
