require 'order'

describe Order do
  subject(:order) {described_class.new}

  let(:order_items) do
    {
      chicken: 3.99,
      falafel: 4.50
    }
  end

  it 'can have a basket of chosen items' do
    expect(order.chosen_items).to eq([])
  end
end
