# require "order"
class Menu
attr_reader :list_of_dishes

  def initialize
    @list_of_dishes = {
      "chicken" => 4.99,
      "fish" => 5.50,
      "beef" => 4.99,
      "vegetarian" => 4.50
    }
  end
end
