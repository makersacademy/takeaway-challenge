class Menu

  attr_reader :menu

  def initialize
    @menu = {"Chicken Noodle Soup" => '3.50',
           "Burger and Fries" => '6',
           "Chicken Tikka Madras" => '7',
           "Fresh Caesar Salad" => '5.50',
           "Traditional English Breakfast" => '5',
           "Singapore Style Noodles" => '4.50',
           }
  end
end