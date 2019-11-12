require './lib/order.rb'

describe Order do
  it { is_expected.to be_instance_of(described_class) }

  describe '#items' do
    it 'should respond be of type hash' do
      expect(subject.items).to be_instance_of(Hash)
    end
  end
end
