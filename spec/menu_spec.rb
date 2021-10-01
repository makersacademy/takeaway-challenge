# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

require "menu"

describe Menu do
  it "has a list of dishes with prices" do
    expect(subject.menu).to include(curried_goat: 7.50)
  end
end
