# IRB SCRIPT
# irb -r ./lib/menu.rb

class Menu
  attr_reader :dishes

  DISHES = {
    1 => [:pizza, 5],
    2 => [:sausage, 3],
    3 => [:chicken, 6],
    4 => [:curry, 7],
    5 => [:family_deal, 15],
  }

  def initialize
    @dishes = DISHES
  end

end
