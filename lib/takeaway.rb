class TakeAway
attr_reader :menu, :dishes

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def order(food)
    
  end
end

class Menu
  attr_reader :dishes, :menu
  def initialize
    @dishes = {"spring roll"=>0.99,
         "char sui bun"=>3.99,
         "pork dumpling"=>2.99,
         "peking duck"=>7.99,
         "fu-king fried rice"=>5.99}
  end

  def read_menu
     @menu.dishes
  end
end
