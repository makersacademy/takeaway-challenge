class Menu
  attr_reader :dishes 
  def initialize 
    @dishes = [{ name: "pizza", price: 10.50 }, 
      { name: "pasta", price: 9.45  },
      { name: "calzone", price: 8.65 },
      { name: "calamari", price: 5.65 },
      { name: "lasagna", price: 10.65 },
      { name: "garlic bread", price: 4.65 }]
  end 


  def add_dishes(dish)
    dishes << dish
  end
end 