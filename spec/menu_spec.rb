require 'menu'

RSpec.describe 'menu' do
  it "returns the menu" do
    menu = [
      { "Pizza" => "7.99" },
      { "Fish and Chips" => "9.99" },
      { "Pancakes with Bacon and Maple Syrup" => "6.99" },
      { "Vegetable Stir Fry with Gyoza" => "8.99" },
      { "Cheese and Pickle Sandwich" => "4.99" },
      { "Ramen" => "6.99" },
      { "Beef Pho" => "9.99" }
    ]
    expect(menu).to eq (menu)
  end

  it "returns one item from the menu" do
    menu = [
      { "Pizza" => "7.99" },
      { "Fish and Chips" => "9.99" },
      { "Pancakes with Bacon and Maple Syrup" => "6.99" },
      { "Vegetable Stir Fry with Gyoza" => "8.99" },
      { "Cheese and Pickle Sandwich" => "4.99" },
      { "Ramen" => "6.99" },
      { "Beef Pho" => "9.99" }
    ]
    menu_item = (menu[0])
    expect(menu_item).to eq ({ "Pizza" => "7.99" })
  end
end
