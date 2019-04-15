class Menu
  attr_reader :dishes

  def initialize
    @dishes = {
      "Spare Ribs" => 6.00, "Seaweed" => 4.50, "Half Duck" => 20.00
    }
  end
end
