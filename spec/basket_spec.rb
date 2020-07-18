require './lib/basket.rb'

describe Basket do
  
  describe '#initializes' do
    it 'with an item list' do
      expect(subject.items).to be_an(Array)
    end
    it 'with a total' do
      expect(subject.total).to be_an(Integer)
    end
  end

  describe '#add_to_basket()' do

    let(:item) {double(:item)}

    it 'adds an item to the items list' do
      subject.add_to_basket(:item)
      expect(subject.items).to include(:item)
    end
  end

end