module Menu

  def menu
    dish_list = {
      'pepperoni pizza' => 5.00,
      'spaghetti pomodoro' => 6.00,
      'spaghetti carbonara' => 7.50,
      'chicken & mushroom risotto' => 8.50,
      'garlic bread' => 3.50,
      'spaghetti bolognese' => 7.00
    }

    dish_list.each do |key, value|
      puts "#{key} => #{'%.2f' % value}"
    end
  end
end
