
class Menu
  attr_reader :dishes

  def initialize
    @dishes = {
      "pad thai" => 6.95,
      "green curry" => 8.95,
      "red curry" => 8.95,
      "nasi goreng" => 4.95,
      "prawn crackers" => 1,
      "rice" => 2
    }
  end

  def show_dishes
    dishes
  end

end
