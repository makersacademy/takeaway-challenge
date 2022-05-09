require './lib/order'

class Menu

attr_reader :menu

  def initialize(menu = [{:dish_number => 1, :name => "pork on rice", :price => 10.0},
      {:dish_number => 2, :name => "chicken on rice", :price => 10.0},
      {:dish_number => 3, :name => "beef on rice", :price => 10.0},
      {:dish_number => 4, :name => "jasmine rice", :price => 2.95}])
    @menu = menu
    $menu_size = @menu.length
  end

end
