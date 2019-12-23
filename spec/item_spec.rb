require 'item'

describe Item do
  let(:subject) { described_class.new("pizza", 8) }

  describe '#initialiszation' do 
    it 'returns an item with name' do
      expect(subject.name).to eq :pizza
    end
    it 'returns an item with price' do 
      expect(subject.price).to eq 8
    end
  end

end
