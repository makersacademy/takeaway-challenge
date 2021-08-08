class Menu

  def initialize
    @starters
    @mains
    @sides
    @desserts
  end

  @starters = [
    {dish:"Soup of the day", price:3},
    {dish:"Garlic bread", price:3}
  ]

  @mains = [
    {dish:"Pizza", price:11},
    {dish:"Fish and chips", price:15},
    {dish:"Burger", price:12},
    {dish:"Seabass", price:16}
  ]

  @sides = [
    {dish:"Chips", price:4},
    {dish:"Salad", price:3}
  ]

  @desserts = [
    {dish:"Tiramisu", price:6},
    {dish:"Chocolate fudge cake", price:7}
  ]
 

  def print_menu
    puts [
      "Starters",
      "Soup of the day £3",
      "Garlic bread £3",
      "",
      "Mains",
      "Pizza £11",
      "Fish and chips £15",
      "Burger £12",
      "Seabass £16",
      "",
      "Desserts",
      "Chips £4",
      "Salad £3",
      "",
      "Sides",
      "Tiramisu £6",
      "Chocolate fudge cake £7"
      ].join("\n")
  end

end