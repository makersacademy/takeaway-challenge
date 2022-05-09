class ListOfDishes
  attr_reader :dishes, :all_dishes, :price_of_dishes
  def initialize
    @dishes = {
      "rice" => 1,
      "noodles" => 2,
      "sweet and sour chicken" => 6,
      "crispy beef" => 7,
      "aromatic duck" => 15,
      "chicken chow mein" => 4
    }
    @all_dishes = []
    @price_of_dishes = []
  end

  def menu_layout
    @dishes.each_with_index do |(name, cost), index|
      @all_dishes << "#{index + 1}. #{name}: £#{cost}"
    end
  end

  def cost_per_dish
    @dishes.each do |(_name, cost)|
      @price_of_dishes << cost.to_i
    end
  end

  def print_menu
    p "The available dishes are: #{@all_dishes}"
  end
end
