require 'menu'

def menu
  menu = [
    { "Pizza" => 7 },
    { "Fish and Chips" => 9 },
    { "Pancakes with Bacon and Maple Syrup" => 6 },
    { "Vegetable Stir Fry with Gyoza" => 8 },
    { "Cheese and Pickle Sandwich" => 4 },
    { "Ramen" => 6 },
    { "Beef Pho" => 9 }
  ]
end

RSpec.describe 'menu' do
  it "returns the menu" do
    expect(menu).to eq (menu)
  end

  it "returns one item from the menu" do
    menu_item = menu[0]
    expect(menu_item).to eq ({ "Pizza" => 7 })
  end
end
