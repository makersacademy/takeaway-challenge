require 'order'

describe Order do
  it 'inits with empty basket' do
    expect(subject.basket).to eq([])
  end

  describe '#add_item' do
    it 'pushes item into basket' do
      subject.add_item({:salmon => 5}, 1)
      expect(subject.basket).to eq([{salmon: 5}])
    end
  end
end