require 'order'

describe Order do

  describe '#add_dish' do
    it 'adds user selected dishes to basket' do
      subject.add_dish('cheeseburger')
      subject.add_dish('chickenburger')
      expect(subject.basket).to eq [
        { 'cheeseburger' => 10 },
        { 'chickenburger' => 12.5 }
      ]
    end
  end

  describe '#show_basket' do
    it 'prints the basket total' do
      subject.add_dish('cheeseburger')
      subject.add_dish('chickenburger')
      expect(subject.show_basket).to eq 'Total: 22.5'
    end
  end

end
