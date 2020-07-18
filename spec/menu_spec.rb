require './lib/menu.rb'

describe Menu do

  #let(:item) { double(:item) }
    
  describe '#initialize' do
    it 'with an array of hashes' do
        expect(subject.items).to be_an(Array)
        expect(subject.items[0]).to be_a(Hash)
    end
  end

  describe '#item_price' do
    it 'returns price of item' do
        #allow(subject).to receive(:menu).and_return({name: "chips", price: 1})
        expect(subject.item_price(subject.items[0])).to eq(1)
    end
  end
end