require 'order'

describe Order do
  it 'initializes with an empty list' do
    expect(subject.list).to eq []
  end

  describe '#add' do
    it 'adds an item to the order' do
      dish = double("dish")
      subject.add(dish)
      expect(subject.list).to eq [dish]
    end
  end
end
