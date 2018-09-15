class TakeAway
  attr_reader :menu, :basket

  def initialize
    @menu = {
            "Sweet & Sour Chicken Balls" => 3.99,
            "Chicken Chowmein" => 4.50,
            "Crispy Shredded Beef" => 5.90,
            "Egg Fried Rice" => 3.00,
            "Fried Duck with Black Bean Sauce" => 6.40
            }
    @basket = {}
  end

  def read_menu
    menu
  end

  def add_dish(dish,number = 1)
    # binding.pry
    fail "that dish isn't on the menu" unless menu.keys.include?(dish)
    @basket.keys.include?(dish) ? @basket[dish] += number : @basket[dish] = number
  end
end
