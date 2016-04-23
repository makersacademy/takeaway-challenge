require 'order'

describe Order do
  subject(:order) {described_class.new}

  it 'expects to add dish and quantity to order' do
    expect(order).to respond_to(:add).with(2).arguments
  end
end
