require 'takeaway'

describe "feature test of takeaway" do

  it "shows a menu" do
    takeaway = Takeaway.new
    expect(takeaway.show_menu).to eq ("Starter: £1\nMain: £2\nDessert: £3")
  end

  it "creates an order" do
    takeaway = Takeaway.new
    expect(takeaway.make_order).to be_a Order
  end

end
