require 'order'

describe Order do
  let(:menu) { double(:menu) }
  let(:menu_item) { { 'dish' => 'Lmb Bhuna', 'price' => 6.95 } }

  before(:each) { allow(menu).to receive(:item).with(1) { menu_item } }

  it 'can add an item to the order' do
    subject.add(menu.item(1))
    expect(subject.items.first).to eq ['Lmb Bhuna', 6.95]
  end

  it 'knows the total number of items in an order' do
    subject.add(menu.item(1))
    expect(subject.total_items).to eq 1
  end

  it 'knows the total cost of items in the order' do
    subject.add(menu.item(1))
    expect(subject.cost).to eq menu.item(1)['price']
  end
end
