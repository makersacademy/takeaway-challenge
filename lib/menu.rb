class Menu

  attr_reader :dishes

  def initialize
    @dishes = {"hamburger" => 5.00, "cheeseburger" => 6.00, "fries" => 3.00, "shake" => 2.00, "veggieburger" => 5.50}
  end


  def list
    @dishes
  end




  private



end