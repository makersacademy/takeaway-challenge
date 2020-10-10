require 'restaurant'

describe Restaurant do
  it "exists" do
    expect(Restaurant).to receive(:new)
    Restaurant.new
  end
  it "contains a list of dishes and prices" do
    restaurant = Restaurant.new
    expect(restaurant.menu[:trout_snout]).to eq(6.50)
    expect(restaurant.menu[:mysterious_dumpling]).to eq(8.00)
    expect(restaurant.menu[:hoof_broth]).to eq(3.30)
    expect(restaurant.menu).to eq({
      trout_snout: 6.50,
      hog_soup: 4.90,
      mysterious_dumpling: 8.00,
      boring_sandwich: 4.00,
      cuttlefish_pate: 11.00,
      hoof_broth: 3.30
    })
  end
  xit "prints the list of dishes for the customer" do
  end

end
