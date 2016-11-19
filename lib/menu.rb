class Menu
  attr_reader :choices, :my_order
  def initialize
    @choices ={burger: 10,  salad: 5, coke: 2}
    @my_order = []
  end

  def select_dish(dish, portions)
    selected_dish = @choices.select{|k,v | k == dish}
    portions.times { @my_order<< selected_dish}
  end

  # def select_my_dishes
  # end
end
