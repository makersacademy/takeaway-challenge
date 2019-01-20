require 'order'

describe Order do
  it "customer can select a dish and add price to bill" do
    subject.select_dish("Tofish Bites", 3)
    expect(subject.receipt).to eq [6, 6, 6]
  end
  it "customer can order a number of dishes from the menu" do
    expect(subject.select_dish("Tofish Bites", 2)).to eq("2x Tofish Bites(s) added to your basket.")
  end
end
