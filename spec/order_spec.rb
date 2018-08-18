require 'order'

describe Order do

  it 'creates an order' do
    expect(described_class).to respond_to(:new)
  end

  it 'adds items to the order' do
    subject.add_item('item-1', 2)
    subject.add_item('item-2', 3)
    expect(subject.order.to_a.flatten.join', ').to eq 'item-1, 2, item-2, 3'
  end

end
