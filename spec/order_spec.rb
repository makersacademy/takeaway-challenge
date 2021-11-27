require 'order'

describe Order do
  subject { described_class.new }
  let(:item) { double :item }

  describe '#initialize' do
    it 'contains list of items' do
      expect(subject.items).to be_an_instance_of(Array)
    end
  end
end