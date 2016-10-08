require 'restaurant'

describe Restaurant do

subject(:restaurant) { described_class.new }

#  order of two items - create a double for the takeaway/order that is an array of dishes
#  empty order - create a double for the takeaway/order that is an empty array

menu_items = {"Beef Dipped in Vinegar"=>5,
"Classic Silky Vietnamese Sausage"=>6,
"Fermented Pork Sausage"=>4,
"Fried Spring (Imperial) Rolls"=>5,
"Grilled Sugarcane Shrimp"=>7,
"Shredded Pork Salad Rolls"=>8,
"Toasted Dried Squid"=>9,
"Salad Rolls Rice Paper"=>3}

it "is initialised with a new empty order that is a hash" do
  expect(subject.takeaway_order).to eq []
end

it "can print the menu items" do
  expect(restaurant.print_menu).to include menu_items
end

end
