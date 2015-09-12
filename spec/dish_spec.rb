require "./lib/dish"

describe Dish do

  subject { Dish.new("Burger", 8) }

  it "has a name" do
    expect(subject.name).to eq("Burger")
  end

  it "has a price" do
    expect(subject.price).to eq(8)
  end

  it "has equality" do
    expect(subject).to eq(Dish.new("Burger", 8))
  end

end





# xit "should see a list of dishes"
# xit "should be able to see list of dishes with prices"
# xit "should be able to see list of available dishes"
# xit "should be able to select a dish"
# xit "should be able to select more than one dish"
# xit "should only be able to select dish if available"
# xit "should be able to add prices of selected dished"
# xit "should be able to place order"
# xit "should raise an error if sum is not correct"
# xit "should be able to recieve text message when order placed"
