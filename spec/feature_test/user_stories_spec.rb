require 'takeaway'

describe "User Stories" do
  let(:takeaway) { TakeAway.new }
  let(:menu) { Menu.new }
  let (:menu_items) { menu.items }
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
  context "so I can make an order" do
    it "I can add items to my order" do
      takeaway.add_to_order("Fish and Chips", 2)
      expect{takeaway.add_to_order("Fish and Chips", 1)}.to change(takeaway, :order)
      # expect(takeaway.view_order).to eq [{"Fish and Chips" => 3}]
    end
    it "I cannot add items that don't exist to my order" do
      message = "Cannot add to order: that dish is not on the menu"
      expect{takeaway.add_to_order(non_existant_dish, 1)}.to raise_error message
    end

  end


end
