require 'order'

describe Order do
  subject { described_class.new }
  let(:item) { double :item }

  describe '#add' do
    it 'adds items to order' do
      subject.add(item)
      expect(subject.items.include(item)).to be_truthy
    end
  end
end