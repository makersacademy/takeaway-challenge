class FoodList
  CURRENT_MENU = {
    "cheesey jalapeno bites" => 5.49,
    "cheese and tomato pizza" => 11.99,
    "dipping sauce" => 0.45,
    "giant choc chip cookie" => 4.99,
    "pepsi max" => 2.49}

    attr_reader :current_menu

  def initialize
    @current_menu = CURRENT_MENU
  end


end
