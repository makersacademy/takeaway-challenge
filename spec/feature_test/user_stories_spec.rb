require 'takeaway'

describe "User Stories" do
  let(:takeaway) { TakeAway.new }
  let(:menu) { Menu.new }
  let(:menu_items) { menu.print }
  let(:non_existant_dish) {double :dish}


  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with price
  context "so I can see what is on the menu" do
    it "displays the menu items and prices" do
      expect(takeaway.view_menu).to eq menu_items
    end
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  context "So I can order dishes" do

    it "allows me to select dishes and amount" do
      dish1 = "Fish and Chips"
      dish2 = "Shephards Pie"
      takeaway.add_to_order(dish1, 2)
      takeaway.add_to_order(dish2)
      expect(takeaway.order).to eq ({dish1 => 2, dish2 => 1})
      expect(takeaway.view_order).to eq ["2x #{dish1}: £15.98", "1x #{dish2}: £5.99"]
    end
    it "raises an error when I try to add a dish that doesn't exist" do
      message = "Cannot add to order: dish doesn't exist"
      expect{takeaway.add_to_order(:non_existant_dish)}.to raise_error message
    end
  end


end
