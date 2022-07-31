require_relative 'takeaway'

class Menu

  attr_reader :dish

  def initialize
    @dish = { "Steak" => 18, "Burger" => 13, "Chicken" => 9, "Fries" => 3, "Cola" => 2 }
  end 
end 
