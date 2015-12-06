require 'order'
describe Order do
  subject(:order) { described_class.new}

  it {is_expected.to respond_to :basket}

  it 'is expected to initialize with and return an empty basket hash' do
    expect(order.basket).to eq Hash.new
  end
end
