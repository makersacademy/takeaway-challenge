class Menu
  attr_reader :all_dishes

  def initialize
    @all_dishes = {}
    premade_dishes
  end

  def new_dish(name, price)
    all_dishes[name] = price
  end

  def premade_dishes
    new_dish :lasagne, 6.50
    new_dish :spaghetti, 7.50
    new_dish :fish_n_chips, 5
    new_dish :chicken_wings, 6
  end
end