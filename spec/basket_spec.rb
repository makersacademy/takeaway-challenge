require './lib/basket.rb'

describe Basket do

    let(:item) {double(:item)}
    let(:item2) {double(:item2)}
  
  describe '#initializes' do
    it 'with an item list' do
      expect(subject.items).to be_an(Array)
    end
    it 'with a total' do
      expect(subject.total).to be_an(Integer)
    end
  end

  describe '#add_to_basket()' do

    #let(:item) {double(:item)}

    it 'adds an item to the items list' do
      subject.add_to_basket(:item)
      expect(subject.items).to include(:item)
    end
    it 'can add varying quantities of an item at one time' do
        subject.add_to_basket(:item, 5)
        expect(subject.items.count).to eq(5)
    end
  end
      
  describe '#calc_total' do

    #let(:item) { double(:item) }#, item_price: {price: 1}) }
    ##let(:price) { double(:price) }
    ##allow(:item).to receive(:[]).with(:price).and_return{1}
    
    it 'sums prices of items in item list' do
      subject.add_to_basket(item)
      ##allow(item).to receive([:price]).and_return(1)
      allow(item).to receive(:item_price) {{ price: 1}}
      #expect(subject.calc_total).to eq(1)
      subject.calc_total
      expect(subject.total).to eq(1)
    end
  end

  describe '#show_total' do

    #let(:item) { double(:item) }

    it 'returns total of listed items' do
      subject.add_to_basket(item)
      allow(item).to receive(:item_price) {{ price: 1}}
      expect(subject.show_total).to eq(1)
    end
  end



end