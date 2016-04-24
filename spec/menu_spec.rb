require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:ramen) { double(:dish, name: "Chilli Chicken Ramen", price: 7.5) }
  let(:gyoza) { double(:dish, name: "Duck Gyoza", price: 4) }
  let(:squid) { double(:dish, name: "Pepper Squid", price: 5.5) }


  describe '#initialize' do
    it 'is created with no dishes' do
      expect(menu.dishes).to be_empty
    end
  end

  describe '#add' do
    it 'adds name and price of dish to dishes' do
      menu.add(ramen)
      expect(menu.dishes).to eq ({"Chilli Chicken Ramen" => 7.50})
    end
  end

  describe '#read' do
    it 'returns a string of all available dishes and prices' do
      menu.add(ramen)
      menu.add(gyoza)
      menu.add(squid)
      list =
      "Chilli Chicken Ramen - £7.50. Duck Gyoza - £4.00. Pepper Squid - £5.50. "
      expect(menu.read).to eq list
    end
  end

end
