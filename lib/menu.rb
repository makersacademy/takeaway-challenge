class Menu
  attr_accessor :dish_list

  def initialize(dish_class: Dish)
    @dish_list = [
      dish_class.new(:Double_trouble, 12.99),
      dish_class.new(:Kiwilicious, 8.99),
      dish_class.new(:Smarty_smarties, 8.49),
      dish_class.new(:Lets_go_nuts, 4.99),
      dish_class.new(:Chocolate_indulgence, 5.99),
    ]
  end
end
