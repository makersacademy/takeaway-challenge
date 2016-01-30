class Menu
  def initialize
    @dish_list = {
      "hello" => 1,
      'cheeseburger' => 3.99,
      'fries' => 1.99,
      'nuggets' => 2.99,
      'wings' => 2.99,
      'soda' => 0.99,
      'juice' => 0.99
    }
  end

  def display
    @dish_list.dup
  end
end
