require_relative "order"

class Menu

  attr_reader :dishes

  def show
    @dishes = { "sweet and sour tofu" => 5,
      "singapore noodles" => 3,
      "szechuan tofu" => 5,
      "rice" => 1 }
  end

end
