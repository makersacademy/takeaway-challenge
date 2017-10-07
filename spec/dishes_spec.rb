require 'dishes'

describe Dishes do
  subject(:dishes) { described_class.new }
  let(:name) { double(:name) }
  let(:price) { double(:price) }

  it 'is initialsed with a menu' do
    expect(dishes.list).to eq([])
  end

  it 'adds dishes' do
    dishes.add_item(name, price)
    expect(dishes.list).to include({ name: name, price: price })
  end

  # expect(:a => 1, :b => 2).to include(:a)

end
