class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
              "Caviar" => 15.00,
              "Lobster" => 30.00,
              "Crab" => 17.00,
              "Chataeubriand" => 50.00,
              "Truffle" => 40.00,
              "Ice Cream" => 100.00
              }
  end

end