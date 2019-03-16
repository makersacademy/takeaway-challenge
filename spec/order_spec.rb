require 'order'

describe Order do
  let(:name) { double :name}
  let(:price) { double :price }
  let(:quantity) { double :quantity }
  let(:item) { double(Item.new(price, quantity), :total => 10) }
  it 'can add items to itself with price and quantity' do
    expect(subject).to respond_to(:add).with(1).argument
  end

  it 'is empty by defalt' do
    expect(subject.full).to eq([])
  end

  it 'item added and stored' do
    subject.add(item)
    expect(subject.order).to include(item)
  end

  it { is_expected.to respond_to(:total) }

  it 'returns a total of zero by default' do
    expect(subject.total).to eq(0)
  end

  it 'returns total of 20 for 2 items worth 10' do
    item = double(Item.new(name, price, quantity), :total => 10)
    subject.add(item)
    subject.add(item)
    expect(subject.total).to eq 20
  end

end
