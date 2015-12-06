class Menu
  attr_reader :contents

  def initialize
    @contents = { "Dish 1" => 5.00,
                  "Dish 2" => 6.00,
                  "Dish 3" => 7.00 }
  end

end
