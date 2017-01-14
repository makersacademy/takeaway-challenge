require 'takeaway'

describe "User Stories" do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with price

  it "so I can see what is on the menu, it displays the menu items and prices" do
    takeaway = TakeAway.new
    dish = "Fish and Chips"
    price = 8
    menu_items = [{dish => price}]
    expect(take_away_menu.view).to eq menu_items
  end


end
