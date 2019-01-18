require 'dish'

describe Dish do
  describe '#defaults' do
    subject { described_class.new('Curry', 5) }
    context 'when created' do
      it 'has a name' do
        expect(subject.name).to eq 'Curry'
      end
      it 'has a price' do
        expect(subject.price).to eq 5
      end
    end
  end
end
