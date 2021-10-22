class Customer


  def initialize
    @dishes = [{"Pasta" => 5}, {"Mac & Cheese" => 4}, {"Kimchi" => 3}, {"Pizza" => 5}, {"Burger" => 3.5}]
    @selected_dish = []
  end 

  def dishes
   @dishes
  end

  # def select_dish(dish)
  #  @selected_dish << dish 
  # end 

  # def selection
  #   @dishes.map |dish| do
  #     if @dishes[0]
  #       @selected_dish << dish
  #     end 
  #   end 
  # end 
end 