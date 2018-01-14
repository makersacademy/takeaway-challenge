class Menu
  attr_reader :meals

  meals = { 'salad' => 5.45, 'burger' => 7.99, 'pizza' => 8.99, 'sandwich' => 3.75,
          'burrito' => 5, 'pie' => 4, 'quiche' => 3 }

  def initialize(meals)
    @meals = meals
  end

  def display
    list = ""
      meals.each do |meal, price|
        list << "#{meal}: #{price}, "
      end
    list[0..-3]
  end

  def price(meal)
    meals[meal]
  end

end
