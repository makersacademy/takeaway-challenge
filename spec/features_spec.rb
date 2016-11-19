require "take_away"

describe "User Stories" do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it "should display a list of dishes with prices" do
    take_away = TakeAway.new
    expect(take_away.menu).to eq [{chicken: 5}, {beef: 6}, {pork: 7}]
  end
end
