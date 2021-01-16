require_relative 'order'

class Menu

DISHES = {"pizza" => 10, "chips" => 4, "beer" => 5, "coke" => 3}

  def initialize
    @order = []
  end


  def list_dishes
    DISHES
  end

  def order(dish)

    @order << Menu::DISHES.select { |k,v| k == dish }
  end

end
