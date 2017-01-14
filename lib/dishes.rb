class Dishes

  def initialize
    @all_dishes = []
    default_dishes
  end

  def all_dishes
    @all_dishes.dup
  end


  # dish = {
  #   name: "test",
  #   price: 5
  # }

  def add_dish(name, price)
    name = {
      dish_name: name,
      dish_price: price
    }
    @all_dishes << name
  end

  def default_dishes
    chicken_tikka = {
      dish_name: "chicken_tikka",
      dish_price: 5
    }

    orange_juice = {
      dish_name: "orange_juice",
      dish_price: 2
    }

    onion_bhaji = {
      dish_name: "onion_bhaji",
      dish_price: 3
    }
    @all_dishes << chicken_tikka
    @all_dishes << orange_juice
    @all_dishes << onion_bhaji
  end

end
