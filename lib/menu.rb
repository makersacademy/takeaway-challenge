class Menu
  
  attr_reader :dishes

  def initialize 
    @dishes = [{ name: "pizza", price: 10.50, number: 1 }, 
      { name: "pasta", price: 9.45, number: 2 },
      { name: "calzone", price: 8.65, number: 3 },
      { name: "calamari", price: 5.65, number: 4 },
      { name: "calamari", price: 5.65, number: 5},
      { name: "garlic bread", price: 4.65, number: 6}]
  end 


  def add_dishes(dish)
    dishes << dish
  end
end 