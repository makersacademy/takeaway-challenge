class Menu
  attr_reader :dishes

  def initialize
    @dishes = {
      "meatball sub" => 5,
      "steak n cheese sub" => 6,
      "low cal turkey sub" => 4
    }
  end

end
