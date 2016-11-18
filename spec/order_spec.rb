require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:pizza) {double :pizza, name: :pizza, price: 10 }
  let(:ice_cream) {double :pizza, name: :ice_cream, price: 5.55 }
  let(:food) { Struct.new(:name, :price) }

  it "should have a menu" do
    expect(order.menu).to be_kind_of Hash
  end

  it "should have a basket" do
    expect(order.basket).to be_kind_of Hash
  end

  it "should be able to add items to basket" do
    order.add_to_basket(pizza)
    expect(order.basket).to eq({pizza: 1})
  end

  it "should be able to return the total" do
    order.add_to_basket(pizza)
    order.add_to_basket(ice_cream)
    expect(order.total).to eq 15.55
  end
end
