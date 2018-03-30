require_relative './dish'

class Menue

  def initialize(menue = {
    pizza: => [Dish.new]
    paste: => [Dish.new]
    side: => [Dish.new]
    salade: => [Dish.new]
    })
    @menue = menue
    @pizza = [
      'Pepperoni Feast',
      'Texan BBQ',
      'Meat feast',
      'Hawaiian',
      'Margarita',
      'Quarter farmature'
    ]
    @paste = [
      'Paste with shrimps',
      'Vegetarian paste',
      'Paste with octopus',
      'Bolognese',
      'Paste carbonara'
    ]
    @side = [
      'Smash potato',
      'Rise'
    ]
    @salade = [
      'Caesar',
      'Turkey with griled vegetables',
      'Mix',
      'Russian'
    ]
  end

  def menue_generator
    @menue
  end
end
