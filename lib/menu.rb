class Menu
  attr_reader :see_menu
  def initialize
    @see_menu = [
      {item: "chicken", price: 5},
      {item: "bread", price: 3},
      {item: "cheese", price: 3}
    ]
  end

end
