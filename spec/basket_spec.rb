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

  describe '#calc_total' do

    let(:item) { double("item") }#, item_price: {price: 1}) }
    #let(:price) { double(:price) }
    #allow(:item).to receive(:[]).with(:price).and_return{1}
    
    it 'sums prices of items in item list' do
      subject.add_to_basket(item)
      allow(item).to receive(:item_price) {{ price: 1}}
      expect(subject.calc_total).to eq(1)
    end
  end


end