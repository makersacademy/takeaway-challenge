class Menu

  attr_reader :dishes

  def initialize
    @dishes = [
      {dish: "Pizza", price: 10},
      {dish: "Parmo", price: 9},
      {dish: "Calzone", price: 11}
    ]  
  end

  def dish(chosen_dish)
    @dishes.find { |dish| dish[:dish] = chosen_dish}
  end

end
