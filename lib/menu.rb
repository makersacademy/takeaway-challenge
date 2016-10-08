require 'restaurant'
require 'takeaway'
require 'user'

class Menu

attr_reader :menu_list

def initialize
  @menu_list = {"Beef Dipped in Vinegar"=>5,
  "Classic Silky Vietnamese Sausage"=>6,
  "Fermented Pork Sausage"=>4,
  "Fried Spring (Imperial) Rolls"=>5,
  "Grilled Sugarcane Shrimp"=>7,
  "Shredded Pork Salad Rolls"=>8,
  "Toasted Dried Squid"=>9,
  "Salad Rolls Rice Paper"=>3}
end

end
