require 'website'

describe Website do

  let(:menu) { double(:menu, list: { 'Dough balls' => 4, 'Bruschetta' => 6, 'Olives' => 3,
    'Margherita' => 9, 'Padana' => 13, 'Giardinera' => 11 } ) }

  describe '#show_menu' do
    it 'will show the menu' do
      pizza = Website.new
      expect(pizza.show_menu).to eq({ 'Dough balls' => 4, 'Bruschetta' => 6, 'Olives' => 3,
        'Margherita' => 9, 'Padana' => 13, 'Giardinera' => 11 })
    end
  end

  describe '#select' do
    it 'will allow me to select the dish I want' do
      subject.select("Dough balls", 1)
      expect(menu.list).to include(subject.item)
    end

    it 'will allow me to select the quantity I want' do
      subject.select("Dough balls", 1)
      expect(subject.quantity).to be_an_instance_of(Integer)
    end
  end
end
