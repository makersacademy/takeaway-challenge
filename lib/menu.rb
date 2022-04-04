class Menu

  def contents
    @contents ||= []
  end

  def add(dish)
    contents << { dish: dish, name: dish.name, price: dish.price }
  end

  def display
    contents.map.with_index do |ordered_dish, index|
      "#{index+1}. #{ordered_dish[:name]} @ #{ordered_dish[:price]} \n"
    end.join
  end

end