require "total_checker"

describe TotalChecker do

  it "calcs the total cost of the basket" do
    basket_double = [{ dish: "chips", quantity: 2, price: 2.00 },
      { dish: "chicken chow mein", quantity: 1, price: 2.80 },
      { dish: "doner kebab", quantity: 4, price: 12.80 }]
    t = TotalChecker.new
    expect(t.calc(basket_double)).to eq(17.60)
  end

  it "returns true if the figure provided is equal to total" do
    t = TotalChecker.new(17.60)
    expect(t.check).to eq(true)
  end

  it "raises an error if the figure provided is not equal to total" do
    t = TotalChecker.new(5.00)
    expect{ t.check }.to raise_error("Please check total again.")
  end

end
