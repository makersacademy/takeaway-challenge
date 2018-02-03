class Menu
  attr_reader :selection, :amount

  def initialize
    @menu = {
      'Nutella on rice cakes and banana on top' => 3,
      'Scrambled eggs' => 4.99,
      'Roasted aubergine & tomato curry' => 5.60,
      'Jacket Potato with whipped feta' => 8.25,
      'Mushroom, ricotta & rocket tart' => 9.20,
      'Cod with beans & artichokes' => 11.40,
    }

    @selection = []
    
    @amount = 0
  end

  def list
    @item_n = 1

    @menu.each do |dish, price|
      puts "#{@item_n}. Dish: #{dish} - Price: #{price}"
      @item_n += 1
    end
  end

  def select(dish, quantity = 1)
    @menu.select do |k, v|
      if k == dish
        @selection << k + " (#{quantity})"
        @amount += v * quantity
      end
    end
    @selection
  end
end
