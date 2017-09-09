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
    expect(order.chosen_items).to eq({})
  end

  it 'can choose an item to add onto the list' do
    order.add("pork dumpling", 2.99)
    expect(order.chosen_items).to eq(order.chosen_items)
  end

  it 'will raise an error if the item is not on the menu' do
    expect{order.add("Breast Of Duck", 12)}.to raise_error("This is not available")
  end
end
