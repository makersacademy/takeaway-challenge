
# contains the menu of a restaurant
class Menu
  attr_reader :list

  def initialize
    @list = { bean_burger: 8,
            vegan_cheese_platter: 6,
            jack_fruit_burger: 8,
            breaded_aubergine: 7 }
  end
end
