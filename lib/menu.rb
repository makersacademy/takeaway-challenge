class Menu
  def initialize
    @list_of_dishes = []
  end

  def list_of_dishes
    @list_of_dishes = [
        { dish: 'Fries', price: 1.99 },
        { dish: 'Cheeseburger', price: 2.99 },
        { dish: 'Coke', price: 0.99 },
        { dish: 'Salad', price: 1.99 },
        { dish: 'Ice Cream', price: 0.99 }
    ]
  end

  def print_menu
    list_of_dishes
  end
end