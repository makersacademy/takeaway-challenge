require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:spaghetti) { double(:dish, name: "Chilli Chicken Ramen", price: 7.50) }

  describe '#initialize' do
    it 'is created with no dishes' do
      expect(menu.dishes).to be_empty
    end
  end

  describe '#add' do
    it 'adds name and price of dish to dishes' do
      menu.add(spaghetti)
      expect(menu.dishes).to eq ({"Chilli Chicken Ramen" => 7.50})
    end
  end

end
