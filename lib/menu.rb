class Menu

  def initialize
    @menu = {"chips" => 2.5, "kebab" => 5.5, "burger" => 4.75}
    @order = []
  end

  def display_menu
    puts @menu
  end

  def select(food_item, num)
    @order << {food_item => num}
    "You have added #{food_item} x#{num}"
  end

end
