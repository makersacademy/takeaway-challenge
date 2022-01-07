require 'order'

describe Order do
  it { is_expected.to respond_to(:add) }
  it { is_expected.to respond_to(:remove) }
  it { is_expected.to respond_to(:items) }

  describe '#add' do
    it 'adds its arguments to #items' do
      subject.add(:pie, :gravy, :mash)
      expect(subject.items).to include(:pie, :gravy, :mash)
    end
  end
  describe '#remove' do
    it 'removes its arguments from #items' do
      subject.add(:pie, :chocolate_sauce, :sprinkles, :mash)
      subject.remove(:chocolate_sauce, :sprinkles)
      expect(subject.items).not_to include(:chocolate_sauce, :sprinkles)
    end
    it 'removes a single copy of the item for each item passed' do
      subject.add(:pie, :gravy, :mash, :mash, :mash)
      subject.remove(:mash)
      expect(subject.items.count(:mash)).to eq(2)
    end
  end
  describe '#items' do
    it 'returns an empty list on initialization' do
      expect(subject.items).to be_empty
    end
  end
end
