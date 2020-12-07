module Dishes

  def initialize
    @menu = [
        {:dish => 'pasta', :price => 8},
        {:dish => 'pizza', :price => 10},
        {:dish => 'roast chicken', :price => 12},
        {:dish => 'soup', :price => 5},
        {:dish => 'sandwich', :price => 7},
        {:dish => 'curry', :price => 9},
    ]
  end

  def add_dish(dish, price)
    @menu << {:dish => dish, :price => price}
  end

  def menu
    @menu
  end

end
