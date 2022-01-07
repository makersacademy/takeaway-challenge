require 'order'

describe Order do
  subject { described_class.new('555-12345') }
  
  it 'knows its mobile number' do
    expect(subject.mobile).to eq('555-12345')
  end

  describe '.new' do
    it 'requires a mobile number as an argument' do
      expect(described_class).to respond_to(:new).with(1).argument
    end
  end

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
