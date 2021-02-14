class Menu
  attr_reader :list

  def initialize
    @list = { "pizza" => 5, "spaghetti" => 6, "sushi" => 10, "nachos" => 8, "burger" => 7 }
  end
end
