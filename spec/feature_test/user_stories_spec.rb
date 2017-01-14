require 'takeaway'

describe "User Stories" do
  let(:takeaway) { TakeAway.new }
  let(:menu) { Menu.new }
  let (:menu_items) { menu.items }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with price
  context "so I can see what is on the menu" do
    it "displays the menu items and prices" do
      expect(takeaway.view_menu).to eq menu_items
    end
  end

#   As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
  context "so I can make an order" do
    it "returns my selection of dishes" do
      takeaway.select("Fish and Chips" * 2)
      expect{takeaway.selection}.to eq [{dish: "Fish and Chips", amount: 2}]
    end
  end


end
