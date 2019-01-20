class Menu

  attr_reader :dishes

  def initialize
    @dishes = [{ name: "pizza", price: 9.99 },
      { name: "calzone", price: 11.50 },
      { name: "kebab", price: 4.99 },
      { name: "soup", price: 5.50 },
      { name: "sandwich", price: 3.50 },
      { name: "garlic bread", price: 3.99 }]
  end


  def add_dishes(dish)
    dishes << dish
  end
end
