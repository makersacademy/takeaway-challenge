class Menu
  attr_reader :dishes, :name

  def initialize(name)
    @dishes = {
      spaghetti: ['Spaghetti deliciously cooked with tomato sauce and parmeggian cheese', 10],
      pizza: ['Pizza ai quattro formaggi', 9]
      caprese: ['Caprese Salad with Pesto Sauce', 6]
      bruschetta: ['An antipasto dish, bruschetta has grilled bread topped with veggies, rubbed garlic and tomato mix.', 6]
      focaccia: ['Fresh dough is topped with caramelized onions, olives, tomato slices, basil leaves, grated parmesan cheese and baked delicious!', 6]
      risotto: ['A plateful of buttery risotto with the goodness of mushrooms.', 7]
      carpaccio: ['Carpaccio is a great starter made out of thin slices of raw beef to die for!', 9]
      tiramisu: ['The delightful tiramisu recipe with sponge fingers soaked in coffee, layered around and smeared with a creamy mascarpone mixture.', 6]
    }
    @name = name
  end

  def welcome
    "Welcome to #{@name}! Would you like to view our menu?"
  end

  def view
   "Tonight's menu is:
      1. #{@dishes[:spaghetti][0]}
      2. #{@dishes[:pizza][0]}"
  end

  def select(dish)
    @dishes[dish.to_sym]
  end
end


