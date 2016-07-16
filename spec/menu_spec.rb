require 'menu'

# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe Menu do
  it 'contains a list of meals and their prices' do
    menu = Menu.new
    expect(menu.items).to include(
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
  it 'checks there is an item on the menu' do
  expect(subject.menu_check("Python soup")).to eq true
  end 
  # it 'retrieves price of item' do
  #   menu = Menu.new
  #   expect(menu.price("python soup")).to eq(17.50)
  # end

end
