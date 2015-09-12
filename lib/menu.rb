module Menu

  def menu
    dish_list = {
      'pepperoni pizza' => 5.00,
      'spaghetti pomodoro' => 6.00,
      'spaghetti carbonara' => 7.50
    }

    dish_list.each do |dish, price|
      puts "#{dish} => #{'%.2f' % price}"
    end
  end
end
