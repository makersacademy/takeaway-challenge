class Menu
  attr_reader :dishes

  @@restaurants = {
    'Five Girls' => {
      'hamburger' => 8.00, 
      'cheeseburger' => 8.00,
      'seitan burger' => 8.00,
      'fries' => 5.00, 
      'milkshake' => 5.00,
      'soda' => 3.00
    },

    'Grandos' => {
      'quarter chicken' => 4.00,
      'half chicken' => 7.00,
      'whole chicken' => 14.00, 
      'fries' => 2.50,
      'garlic bread' => 2.50,
      'corn on the cob' => 2.50, 
      'grilled halloumi' => 2.50
    },

    'LEONA' => {
      'halloumi wrap' => 6.50,
      'fish finger wrap' => 6.50,
      'black bean box' => 6.50,
      'chilli chicken box' => 6.50,
      'warm salad' => 6.00,
      'iced tea' => 3.50,
      'matcha latte' => 3.00
    }
  }

  def initialize(restaurant)
    unless @@restaurants.has_key?(restaurant)
      raise "#{restaurant} is not listed. Please choose from the list (menu.options)" 
    end
    @dishes = @@restaurants[restaurant]
  end
end
