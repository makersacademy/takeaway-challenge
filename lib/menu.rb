class Menu

  attr_reader :dishes

  def initialize(menu = default_menu)
    @dishes = menu
  end

  def default_menu
    [{ item: "Fish & Chips", price: 6 },
    { item: "Lasagne", price: 8 },
    { item: "Butternut Squash Risotto", price: 7.5 },
    { item: "Mushroom & Spinach Pie", price: 7 },
    { item: "Macaroni Cheese", price: 6.5 },
    { item: "Margharita Pizza", price: 7 }]
  end

  def print_menu
    @dishes.each_with_index.map do |dish, index|
      "#{index + 1}. #{dish[:item]}, £#{dish[:price]}"
    end
  end

end
