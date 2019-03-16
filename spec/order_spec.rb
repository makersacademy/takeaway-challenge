require 'order'

describe Order do

  let(:order) { Order.new }

  it 'can create an array' do
    expect(order.contents).to eq []
  end

end
