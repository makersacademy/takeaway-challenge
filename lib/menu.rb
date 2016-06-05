#require 'menu'

class Menu

  Dishes  = {
    "Fried_spring_rolls"	=> 6.25,
    "Crispy_prawns"	=>	7.50,
    "Thai calamari" =>	6.25,
    "Chicken satay" => 7.50,
    "Beef mussaman curry" => 11.00,
    "Thai green curry" => 12.00,
    "Pineapple fried rice" => 12.50,
    "Salmon red curry"	=>	12.00,
    "Pad Thai"	=> 10.00,
    "Steamed Jasmine Rice"	=>	2.50,
    "Egg Fried Rice" => 3.50,
    "Plain Noodles"	=>	4.00,
    "Steamed coconut rice"	=>	4.00,
}
  def initialize
  end

    def display
    p Dishes
  end

    def select
    p 'Please select which dishes you would like from the menu'
    # <%= Dishes.select(:sex, %w{ #display }, {:include_blank => 'None Specified'} ) %>
    #response.gets_chomp
  end

end
