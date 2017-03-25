class Menu

  def initialize
  @dishes = [
    {name: "Cheeseburger", price: 6.00},
    {name: "Hamburger", price: 5.00},
    {name: "Pizza", price: 7.00},
    {name: "Milkshake", price: 3.00},
    {name: "Burrito", price: 6.00}
  ]
  end

  attr_reader :dishes, :view

  def create_dish(name, price)
    self.dishes << {name: name, price: price}
  end

  def view
    dishes
  end

  private
  attr_writer :dishes
end
