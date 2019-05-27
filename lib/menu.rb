class Menu
  attr_reader :see_menu
  def initialize
    @see_menu = [
      {item: "chicken", price: "£5.99"},
      {item: "bread", price: "£1.99"},
      {item: "cheese", price: "£2.99"}
    ]
  end
end
