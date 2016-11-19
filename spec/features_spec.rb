require "take_away"

describe "User Stories" do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it "should display a list of dishes with prices" do
    take_away = TakeAway.new
    expect(take_away.menu).to eq [{chicken: 5}, {beef: 6}, {pork: 7}]
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

  it "should allow to select the number of dishes" do
    take_away = TakeAway.new
    expect(take_away.order("chicken",2,"beef",2)).to eq "You ordered 2 dish(es) of chicken 2 dish(es) of beef "
  end
end
