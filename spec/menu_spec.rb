require 'menu'

describe Menu do
  it 'should exist' do
    expect(subject).to be_instance_of Menu
  end
  it 'initializes with a menu including at least 1 food item' do
    expect(subject.menu.count).to be >= 1
  end
  
  describe '#price' do
    it 'returns the price of an item' do
      expect(subject.price("spring rolls")).to eq 3.00
    end
  end
end
