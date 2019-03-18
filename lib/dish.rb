class Dish

  attr_reader :dishes

  def initialize
    @dishes = [{ name: 'chinese', price: 8 }, 
  { name: 'fishandchips', price: 7 }, 
  { name: 'chicken', price: 5 }, { name: 'beef', price: 6 }]

  end 

end 
