require 'menu'

describe Menu do

let(:order){ {'formule1' => 2, 'drink' => 2} }

  describe '#print' do
    it 'print the menu' do
      expect(subject.print).to eq(Menu::LIST_OF_DISHES)
    end
  end

  describe '#select' do
   it 'checks if dishes are in the menu - hardcoded values' do
    expect((Menu::LIST_OF_DISHES).keys).to include *order.keys
   end
  end

end
