require 'order'

describe Order do
  it "customer can select a dish and add to basket" do
    subject.select_dish("Tofish Bites", 1)
    expect(subject.basket).to include("Tofish Bites": 6)
  end
  it "customer can order a number of dishes from the menu" do
    expect(subject.select_dish("Tofish Bites", 2)).to eq("2x Tofish Bites(s) added to your basket.")
  end
end
