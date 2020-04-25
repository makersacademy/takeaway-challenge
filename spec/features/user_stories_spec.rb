# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
####################
describe "User stories" do
  it "can show the menu" do
    restaurant = Restaurant.new
    expect { restaurant.show_menu }.not_to raise_error
  end
  
  it "has a menu" do
    restaurant = Restaurant.new
    expect {restaurant.menu}.not_to raise_error
  end

  describe "#show_menu" do
    it "shows menu" do
      restaurant = Restaurant.new
      expect(restaurant.show_menu).to be_kind_of(Hash)
    end
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
####################
  it "allows the customer to select dishes" do
    restaurant = Restaurant.new
    expect {restaurant.select_items }.not_to raise_error
  end

end