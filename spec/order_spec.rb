require 'order'

describe Order do
  let(:dish) { double(:dish, price: 1) }
  let(:menu) { double(:menu, dish_from_name: dish) }
  it 'has a name' do
    order = described_class.new(menu, 'Foo soup', 1)
    expect(order.name).to eq('Foo soup')
  end
  it 'has a price' do
    order = described_class.new(menu, 'Foo soup', 1)
    expect(order.price).to eq(1)
  end
  it 'has a quantity' do
    order = described_class.new(menu, 'Foo soup', 1)
    expect(order.quantity).to eq(1)
  end
  it 'can return if a dish is valid' do
    order = described_class.new(menu, 'Foo soup', 1)
    expect(order.valid?).to be(true)
  end
  it 'can return if a dish is not valid' do
    allow(menu).to receive(:dish_from_name).and_return(nil)
    order = described_class.new(menu, 'Foo soup', 1)
    expect(order.valid?).to be(false)
  end
end
