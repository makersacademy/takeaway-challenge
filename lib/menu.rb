class Menu
  DISHES = [
    { number: 1, name: 'Southern fried chicken', price: 9.00 },
    { number: 2, name: 'Chicken-skin fries', price: 3.00 }
  ]

  def display_menu
    DISHES.each do |dish|
      display_dish(dish)
    end
  end

  def display_dish(dish)
    dish_price = '%.2f' % dish[:price]
    dish_as_string = "#{dish[:number].to_s}. "\
      "#{dish[:name]} - £#{dish_price}"
    puts dish_as_string
  end

  private :display_dish
end