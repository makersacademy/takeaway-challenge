class Takeaway

  attr_reader :menu_list
  def initialize
    @menu_list = [
      {"rice" => 3},
      {"chicken" => 4},
      {"salad" => 3},
      {"pizza" => 5},
      {"cola" => 2}
    ]
  end

  def menu
    @menu_list
  end
end
