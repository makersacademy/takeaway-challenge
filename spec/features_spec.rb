require "take_away"

describe "User Stories" do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it "should display a list of dishes with prices" do
    take_away = TakeAway.new(Order,SMS)
    expect(take_away.menu).to eq ({chicken: 5, beef: 6, pork: 7})
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

  it "should allow to select the dish and number of dishes wanted" do
    take_away = TakeAway.new(Order,SMS)
    expect(take_away.add_to_basket("chicken",2)).to eq "You added 2 x chicken to the basket."
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it "should check that the total dishes price matches the amount introduced" do
    take_away = TakeAway.new(Order,SMS)
    take_away.add_to_basket("chicken",5)
    expect(take_away.check_price(25)).to be true
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  it "should confirm the order with a text message" do
    t = Time.now
    take_away = TakeAway.new(Order,SMS)
    take_away.add_to_basket("chicken",5)
    take_away.add_to_basket("pork",5)
    # expect(take_away.confirm_order(60)).to be eq "Thank you! Your order was placed and will be delivered before 23:57"
  end
end
