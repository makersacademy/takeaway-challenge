require 'order'

describe Order do
  let(:menu) { double(:menu) }
  let(:menu_item) { { 'dish' => 'Pepperoni', 'price' => 9.95 } }

  before(:each) { allow(menu).to receive(:item).with(1) { menu_item } }

  it 'can add an item to the order' do
    subject.add!(menu.item(1), 2)
    expect(subject.items.first).to eq ['Pepperoni', [9.95, 2]]
  end

  it 'knows the total number of items in an order' do
    subject.add!(menu.item(1), 2)
    expect(subject.total_items).to eq 1
  end

  it 'knows the total cost of items in the order' do
    subject.add!(menu.item(1), 2)
    expect(subject.cost).to eq menu.item(1)['price'] * 2
  end

  it 'can cycle through each item' do
    subject.add!(menu.item(1), 2)
    expect { subject.each_item { |k, v| puts "#{k}#{v}" } }.to output.to_stdout
  end
end
