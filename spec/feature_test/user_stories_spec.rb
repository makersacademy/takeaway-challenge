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



end
