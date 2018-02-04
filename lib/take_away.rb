require_relative 'order'

class TakeAway
  attr_reader :selection, :current_amount, :menu

  def initialize
    @menu = {
      'Nutella on rice cakes and banana on top' => 3,
      'Scrambled eggs' => 4.99,
      'Roasted aubergine & tomato curry' => 5.60,
      'Jacket Potato with whipped feta' => 8.25,
      'Mushroom, ricotta & rocket tart' => 9.20,
      'Cod with beans & artichokes' => 11.40,
    }

    @selection = {}
  end

  def list
    item_n = 0

    @menu.each do |dish, price|
      item_n += 1
      puts "#{item_n}. Dish: #{dish} - Price: #{price}"
    end
  end

  def select(dish, quantity = 1)
    if @menu[dish]
      @selection[dish] = quantity
    end
    @selection
  end
end
