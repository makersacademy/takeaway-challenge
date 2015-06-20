require 'order'
describe Order do
  let (:order) {Order.new}
  it { is_expected.to respond_to :create }

  it 'takes in an item and returns the cost' do
    expect(order.create(["Chop Suey", 1])).to eq 7.00
  end

  it 'takes in two items and returns the cost' do
    expect(order.create(["Chop Suey", 1], ["Dim Sum", 2])).to eq 20.00

  end

end
