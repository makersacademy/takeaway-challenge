class Menu

  attr_reader :all

  def initialize
    @all = [
    {dish: "Pizza", price: 8},
    {dish: "Soup", price: 5},
    {dish: "Hot Dog", price: 2},
    {dish: "Pad Thai", price: 9},
    {dish: "Steak", price: 12} ]
  end
end