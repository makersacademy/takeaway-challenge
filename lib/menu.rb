class Menu

  attr_reader :menu

  def initialize
    @menu = [
      { :dish => "Olives and sun-dried tomatos", :price => 2 },
      { :dish => "Soup of the day", :price => 4.5 },
      { :dish => "Fried calamari with homemade dressing", :price => 6.8 },
      { :dish => "Oven baked goat cheese", :price => 7.5 },
      { :dish => "Mixed leaf salad", :price => 3.2 },
      { :dish => "Sliced fresh tomato with mozarella", :price => 7.5 },
      { :dish => "Margherita", :price => 6.9 },
      { :dish => "Rigatoni al pomodoro", :price => 7 },
      { :dish => "Risotto mare", :price => 12.50 },
      { :dish => "Homemade tiramisu", :price => 5 }
    ]
  end

  def select_dishes(dish_number)
    dish = @menu[dish_number.to_i - 1]
    dish
  end

end
