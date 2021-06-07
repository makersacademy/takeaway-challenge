class Menu
  attr_reader :dishes

  def initialize
    @dishes = {
      spaghetti: ['Spaghetti deliciously cooked with tomato sauce and parmeggian cheese', 10],
      pizza: ['Pizza ai quattro formaggi', 9],
      caprese: ['Caprese Salad with Pesto Sauce', 6],
      bruschetta: ['An antipasto dish, bruschetta has grilled bread topped with veggies, rubbed garlic and tomato mix.', 6],
      focaccia: ['Fresh dough is topped with caramelized onions, olives, tomato slices, basil leaves, grated parmesan cheese and baked delicious!', 6],
      risotto: ['A plateful of buttery risotto with the goodness of mushrooms.', 7],
      carpaccio: ['Carpaccio is a great starter made out of thin slices of raw beef to die for!', 9],
      tiramisu: ['The delightful tiramisu recipe with sponge fingers soaked in coffee, layered around and smeared with a creamy mascarpone mixture.', 6]
    }
  end

  def view
    @dishes.each_with_index {|(key, value),index|
      "#{index + 1}. #{value[0]} -----------------------> $#{value[1]}"
    }
  end

  def select(dish)
    @dishes[dish.to_sym]
  end
end



