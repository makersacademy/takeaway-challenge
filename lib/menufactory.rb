require './lib/menu'
require './lib/dish'

class MenuFactory

  def self.build(array_of_dish_hashes)
    Menu.new(Dish,array_of_dish_hashes).method
  end

  def method
  end
end
