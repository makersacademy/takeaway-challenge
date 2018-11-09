class Takeaway
  attr_reader :dishes, :selected

  def initialize
    @dishes = [{ item_no: 1, dish: "Pizza", price: 20 },
      { item_no: 2, dish: "Kebab", price: 12 },
      { item_no: 3, dish: "Sushi", price: 22 },
      { item_no: 4, dish: "Burger", price: 10 }
    ]
    @selected = []
  end  

  def see_dishes
    dishes
  end

  def select_dish
  end

end
