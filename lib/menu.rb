class Menu
  
  attr_reader :dishes, :selected_dishes

  def initialize
    @dishes = [
      {name: 'pizza', price: 10},
      {name: 'burger', price: 8},
      {name: 'cake', price: 5},
      {name: 'salad', price: 6},
      {name: 'paella', price: 12}
    ]

    @selected_dishes = [] #unsure of I'll keep this... 
  end

  # def select(dish)
  #   @selected_dishes << dish
  # end
end