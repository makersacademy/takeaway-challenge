require "./lib/takeaway."

describe Takeaway do
  it "allows the user to see a menu including items and prices" do
    takeaway = Takeaway.new
    expect(takeaway.menu).to include({
      :pizza => 5.20,
      :kebab => 3.00,
      :chips => 1.20,
      :drink => 0.80,
    })
  end
end
