module Menu

  def display_menu
    dish_list = {
      pepperoni_pizza: 5.00,
      spaghetti_pomodoro: 6.00,
      spaghetti_carbonara: 7.50
    }

    dish_list.each do |dish, price|
      puts "#{dish}: £#{'%.2f' % price}"
    end
  end
end
