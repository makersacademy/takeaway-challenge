
class Dish
  attr_reader :name
  attr_reader :price

  def initialize(name = '', price = 0)
    @name = name
    @price = price
  end

  def self.rand_pizza_dish
    pizza = [
      'Pepperoni Feast',
      'Texan BBQ',
      'Meat feast',
      'Hawaiian',
      'Margarita',
      'Quarter farmature'
    ]
    pizza_price = [8.30, 9.00, 10.50]
    Dish.new(pizza.sample, pizza_price.sample)
  end

  def self.rand_paste_dish
    paste = [
      'Paste with shrimps',
      'Vegetarian paste',
      'Paste with octopus',
      'Bolognese',
      'Paste carbonara'
    ]
    paste_price = [8.20, 7.90, 10.00]
    Dish.new(paste.sample, paste_price.sample)
  end

  def self.rand_side_dish
    side = [
      'Smash potato',
      'Rise',
      'Fried potato'
    ]
    side_price = [3.50, 4.00, 5.00]
    Dish.new(side.sample, side_price.sample)
  end

  def self.rand_salade_dish
    salade = [
      'Caesar',
      'Turkey with griled vegetables',
      'Mix',
      'Russian'
    ]
    salade_price = [4.20, 5.30, 5.85]
    Dish.new(salade.sample, salade_price.sample)
  end
end
