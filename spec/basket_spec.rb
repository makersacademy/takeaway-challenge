require './lib/basket.rb'

describe Basket do

  
  describe '#initializes' do
#    it 'with a menu' do
#      expect(subject.menu).to be_an(Array)
#    end
    it 'with a total' do
      expect(subject.total).to be_an(Integer)
    end
    it 'with an empty list array' do
      expect(subject.items).to eq([])
    end
  end

  describe '#add()' do

    let(:item) {double(:item, item_price: 1)}

    it 'adds an item to the items list' do
      subject.add(:item)
      expect(subject.items).to include(:item)
    end
    it 'can add varying quantities of an item at one time' do
        subject.add(:item, 5)
        expect(subject.items.count).to eq(5)
    end
  end
      
  describe '#calc_total' do
    
    it 'sums prices of items in item list' do
      item = subject.menu_class.new.items[0]
      subject.add(item)
      subject.calc_total
      expect(subject.total).to eq(item[:price])
    end
  end

  describe '#show_total' do

    it 'returns total of prices of items in basket' do
      expect(subject.show_total).to eq(0)
      item = subject.menu_class.new.items[0]
      subject.add(item)
      expect(subject.show_total).to eq(subject.menu_class.new.items[0][:price])
    end
  end




end