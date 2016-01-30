class Takeaway

  MENU = { "Spring Roll" => 1.95,
           "Prawn Crackers" => 1.60,
           "Fried Pork Dumpling" => 2.10,
           "Won Ton" => 3.70,
           "Chicken and Noodle Soup" => 1.90,
           "Pork Chow Mein" => 4.60,
           "Szechuan Vegetables" => 4.15,
           "King Prawn Kung Po" => 5.40
         }.freeze

  attr_reader :basket

  def initialize
    @basket = []
  end



  def read_menu
    MENU
  end


private

end
