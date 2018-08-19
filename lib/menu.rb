class Menu

  attr_reader :dishes


  def initialize(dishes = { "pepperoni" => 7.50, "hawaiian" => 6.50, "vegetarian" => 5.50 })
    @dishes = dishes
  end




  def print_menu
    dishes.map { |dish, price| "#{dish.capitalize} £#{'%.2f' % price}" }.join(", ")

  end




end
