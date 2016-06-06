# contains menu data

class Menu

  attr_reader :dishes

  def initialize
    @dishes = DISHES
  end

  def view_menu
  	dishes.map { |key, value| "#{key}, £#{sprintf('%.2f', value)}\n" }.join('')
  end

  private 

  DISHES = {"Pilau Rice" => 2.20,
             "Egg Fried Rice" => 2.50}

end