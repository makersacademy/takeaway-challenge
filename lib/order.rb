require_relative "list"

class Order

  def initialize(list = List.new)
    @list = list
  end

  # @menu = [
  #     {:dish => "Coffee", :price => 2.50},
  #     {:dish => "Soft Drink", :price => 1.50},
  #     {:dish => "Sandwich (Cold)", :price => 5.90},
  #     {:dish => "Sandwich (Hot)", :price => 8.90},
  #     {:dish => "Fresh Juices", :price => 4.70},
  #     {:dish => "Pastries", :price => 1.80}
  #   ]

def see_menu
  @list.menu
end

def select_dishes(dish)
  selection = []
  dishes = @list.menu

  dishes.each do |hash|
    hash.each do |key, value|
      if dish == key[:dish]
      selection << dish
      end
    end
  end
end

end