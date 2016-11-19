require "take_away"

describe "User Stories" do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it "should display a list of dishes with prices" do
    take_away = TakeAway.new(Order)
    expect(take_away.menu).to eq ({chicken: 5, beef: 6, pork: 7})
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

  it "should allow to select the number of dishes" do
    take_away = TakeAway.new(Order)
    expect(take_away.add_to_basket("chicken",2)).to eq "You added 2 x chicken to the basket."
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  # it "should check that the total value matches the amount introduced" do
  #   take_away = TakeAway.new(Order)
  #   expect{take_away.order("chicken",2,"beef",2, 23)}.to raise_error "Incorrect total value."
  # end
end
