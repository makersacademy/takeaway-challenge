class Menu

  attr_reader :meals

  def initialize
    @meals = {
      :padthai => 6.00,
      :massamancurry => 7.00,
      :bokchoi => 2.00,
      :rice => 1.00
    }
  end

  def view_menu
    @meals
  end
end

# @meals = {
#   1 => {:padthai => 6.00},
#   2 => {:massamancurry => 7.00},
#   3 => {:bokchoi => 2.00},
#   4 => {:rice => 1.00}
# }
