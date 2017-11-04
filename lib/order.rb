# Order class for takeaway challenge
class Order

  def selection
    selection
  end

  def menu_options
    { 'Miso Soup' => 1.50, 'Saitan' => 2.50, 'Tofu Steak' => 3.00 }
  end

  def list_of_dishes
    selection = 0
    menu_options.each do |meal, value|
      puts "#{selection += 1}. #{meal} > #{value.to_s}"
    end
  end

  def place_order(chosen_meals, dish_quantity, total_sum)
  end

  def chosen_meal
    'meal'
  end

  def dish_quantity
    3
  end

end
