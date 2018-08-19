class Takeaway

  attr_reader :dishes

  def initialize
    @dishes = { "Pepperoni" => 7.50, "Hawaiian" => 6.50, "vegetarian" => 5.50 }
  end


  def view_menu
    dishes
  end



end
