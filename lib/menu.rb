class Menu

  attr_reader :menu_list, :print_menu

  def initialize
    @menu_list = [
      { dish: 'Rice', price: 3.00 },
      { dish: 'Chicken', price: 5.00 },
      { dish: 'Salad', price: 3.00 },
      { dish: 'Pizza', price: 10.00 }
    ]
  end

  def print_menu
    @menu_list.map { |dish| "#{dish[:dish]}: £#{dish[:price]}" }
  end
end
