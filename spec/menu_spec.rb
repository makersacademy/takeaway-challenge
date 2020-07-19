require './lib/menu.rb'

describe Menu do
    
  describe '#initalize' do
    it 'with an array of hashes' do
      expect(subject.items).to be_an(Array)
      expect(subject.items[0]).to be_a(Hash)
    end
  end
  
  describe '#item_price()' do
    it 'a) returns integer b) the price value' do
      item = subject.items[0]
      expect(subject.item_price(item)).to be_an(Integer)
      expect(subject.item_price(item)).to eq(item[:price])
    end
  end

end