require 'customer'
class Resturant
attr_reader :choice
  def initialize
    @dishes = [{"Chips" => 2.50, "Garlic Bread" => 3.50, "Hot Dog" => 4.50}]
    @sum = 0
    @choice = []
  end 
end