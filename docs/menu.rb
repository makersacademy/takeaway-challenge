class Menu
  attr_reader :menu

  def initialize(menu = make_menu)
    @menu = menu
  end

  def find_dish(food_name)
    @menu.select { |dish| dish if dish[:dish] == food_name }
  end

  def print_menu
    @menu.select do |items|
      puts "#{items[:dish]} --- £#{items[:price]}"
    end
  end

  private

  def make_menu
    sorted_list = []
    food.zip(price).each do |dish, cost|
      hash = { dish: dish, price: cost }
      sorted_list.push(hash)
    end
    sorted_list
  end

  def food
    ['Happily ever after spell', 'Poison apple',
      'Love potion', 'Dragon tears', 'Find me a prince spell',
      'Find me a princess spell', 'Make me a developer potion']
  end

  def price
    [250, 1, 350, 1000, 1500, 1500, 8000]
  end

end
