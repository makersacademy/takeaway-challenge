# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe "User stories" do
  it "can show the menu" do
    restaurant = Restaurant.new
    expect { restaurant.see_menu }.not_to raise_error
  end
  
  it "has a menu" do
    restaurant = Restaurant.new
    expect {restaurant.menu}.not_to raise_error
  end

  describe "#see_menu" do
    it "shows menu" do
      restaurant = Restaurant.new
      expect(restaurant.see_menu).to eq restaurant.menu
    end
  end
  
end

