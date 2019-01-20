require 'order'

describe Order do
  let(:order_3_tofish) { subject.select_dish("Tofish Bites", 3) ; subject}

  it "customer can select a dish and add price to bill" do
    expect(order_3_tofish.receipt).to eq [6, 6, 6]
  end

  it "customer can order a number of dishes from the menu" do
    expect(subject.select_dish("Tofish Bites", 3)).to eq "3x Tofish Bites(s) added to your basket."
  end

  it "adds up total of selected dishes" do
    expect(order_3_tofish.total).to eq "Total: £18"
  end

  it "sends sms on checkout" do
    expect(order_3_tofish.checkout).to eq nil
  end
end
