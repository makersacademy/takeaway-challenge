require 'menu_item'

describe MenuItem do
  tuna = MenuItem.new(:tuna, 12)

  describe '#name' do
    it 'has a name when initalized' do
      expect(tuna.name).to eq :tuna
    end

    describe '#price' do
      it 'has a price' do
        expect(tuna.price).to eq 12
      end
    end
  end
end
