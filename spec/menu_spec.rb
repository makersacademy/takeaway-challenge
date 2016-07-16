
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
require 'menu'

describe Menu do

it 'produces a list of items on the menu' do
menu = Menu.new
    expect(menu.dishes).to include(
      "Mealworm Croquettes" => 1.20,
      "Larve Paprika Crisps" => 1.50,
      "Crunchy Chicken Claw" => 2.40,
      "Zingy Zebra Bites" => 3.80,
      "Springbok rolls" => 4.30,
      "Buffalow salad" => 10.20,
      "Ostrich steak" => 13.55,
      "Crocodile burger" => 14.25,
      "Kangaroo con carne" => 15.20,
      "Python soup" => 17.50,
      "Pufferfish cakes" => 21.50,
    )
end
end
