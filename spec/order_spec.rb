require "order"

describe Order do

  it { is_expected.to respond_to(:select_dishes).with(1).argument }

  it "allows the customer to select some number of several dishes" do
    order = { "Runny Risotto" => 2,
              "Cold Pizza" => 3 }
    expect(subject.select_dishes(order)).to eq order
  end

  it "checks if the ordered items are on the menu" do
    
  end
end
