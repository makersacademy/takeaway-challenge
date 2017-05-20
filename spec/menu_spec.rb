require './lib/menu.rb'

describe Menu do
  let(:menu) { described_class.new(:dishes, :prices) }

  describe '#initialize' do
    it 'is initialized with dishes' do
      expect(menu.dishes).to eq :dishes
    end

    it 'is initialized with prices' do
      expect(menu.prices).to eq :prices
    end
  end

  describe '#list dishes' do

  it 'can see the list of dishes' do
    complete_menu = {:starters => ["Olives", "Pitta bread,"], :main_course => ["Fried duck", "Fish & Chips"], :dessert => ["Jam roll", "Apple crumble"]}
    expect(menu.list_dishes).to eq complete_menu
  end

end 



end
