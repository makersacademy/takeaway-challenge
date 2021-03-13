require 'order'

describe Order do
  let(:order001) { Order.new}

  it "initializes with an order number" do
    expect(order001.number).to eq(1)
  end

  it "initializes with an empty basket" do
    expect(order001.basket).to be_kind_of(Array)
  end

end
