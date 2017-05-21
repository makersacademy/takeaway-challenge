# require "order"
class Menu
attr_reader :list_of_dishes

  def initialize
    @list_of_dishes = {
      "chicken" => (sprintf "%.2f", 4.99),
      "fish" => (sprintf "%.2f", 5.50),
      "beef" => (sprintf "%.2f", 4.99),
      "vegetarian" => (sprintf "%.2f", 4.50)
    }
  end
end
