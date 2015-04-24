class Menu
  attr_reader :dishes
  def initialize
    @dishes = [
        { name: 'Burger', price: 10.95  },
        { name: 'Pizza', price: 14.00 },
        { name: 'Salad', price: 7.60 },
        { name: 'fries', price: 2.90 }
     ]
  end

   def add_dish(dish)
     @dishes << dish
   end
end