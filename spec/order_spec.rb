require './lib/order'

describe Order do

  let(:order) { described_class.new }
  let(:item) { double(:item) }

  it "creates an empty basket on initialization" do
    expect(order.basket).to eq []
  end

  it { is_expected.to respond_to(:add_to_basket) }

  it "allows users to add items to basket" do
    order.add_to_basket(item)
    expect(order.basket).to eq [item]
  end




end
