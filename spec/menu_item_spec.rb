require 'menu_item'

describe MenuItem do

  let(:sushi_item) { described_class.new('sushi', '3.00') }
  let(:fish_item) { described_class.new('fish curry', '11.40') }

  describe '#name' do
    it 'returns the name of the dish as "Sushi"' do
      expect(sushi_item.name).to eq('sushi')
    end

    it 'returns the name of the dish as "Fish Curry"' do
      expect(fish_item.name).to eq('fish curry')
    end
  end

  describe '#price' do
    it 'returns the price of dish "3.00"' do
      expect(sushi_item.price).to eq('3.00')
    end
    it 'returns the price of dish "11.40"' do
      expect(fish_item.price).to eq('11.40')
    end
  end
end
