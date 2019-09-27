class Menu
attr_reader :list

  def initialize
    @list = [
      {name: "pizza", price: 5},
      {name: "curry", price: 7},
      {name: "kebab", price: 4},
      {name: "ramen", price: 9},
      {name: "pad thai", price: 5}
    ]

  end

  def print_menu
    list  
  end
end
