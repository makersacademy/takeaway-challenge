class Menu

  def show_menu(restaurant)
    restaurant.list_of_dishes.each { |name, price|
      puts "#{name}: £#{price}"
    }
  end

end
