require 'takeaway'

RSpec.describe Takeaway do

  let(:menu) { Menu.new }
  let(:main) { 'Lamb Nihari' }
  let(:side) { 'Garlic naan' }
  let(:drink) { 'Water' }
  let("option1") { Menu::MAINS.select { |key| key[main] } }
  let("option2") { Menu::SIDES.select { |key| key[side] } }
  let("option3") { Menu::DRINKS.select { |key| key[drink] } }

  describe '#menu' do
    it 'prints out the menu of the takeaway' do
      expect(subject.menu).to eq ("|MAINS|: Lamb Nihari: £8.00, Haleem: £9.00, Chicken Karahi: £6.00, Biryani: £5.00 |\n    |SIDES|: Plain naan: £1.20, Garlic naan: £1.80, Chutney: £0.50, Rice: £2.50 |\n    |DRINKS|: Mango lassi: £1.650, Coke: £0.60, Fanta: £0.60, Water: £1.20 |")
    end
  end

  describe '#place_order' do
    it 'matches order to menu item' do
      expect(subject.place_order(main)).to include(option1)
      expect(subject.place_order(side)).to include(option2)
      expect(subject.place_order(drink)).to include(option3)
    end

    it 'raises error when item is not recognised' do
      choice = "Lobster"
      expect {subject.place_order(choice)}.to raise_error "Sorry we don't sell #{choice}"
    end

  end

    context 'when an order is placed' do
      it 'puts the order into the basket' do
        subject.place_order(side)
        expect(subject.basket).to include(include(side))
      end
    end
end
