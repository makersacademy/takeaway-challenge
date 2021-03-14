require 'order'

describe Order do
  let(:dish) { "Hamburger" }
  let(:menu_double) { double("Menu", dishes: [{ name: "Hamburger", price: 10 },
    { name: "Chips", price: 4 },
    { name: "Orange Juice", price: 2 }]) }

  describe '#initialize' do
    it 'creates a blank order' do
      expect(subject.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'adds an item to the order' do
        expect { subject.add_item(dish) }.to change { subject.items.length }.by(1)
    end
    context 'when no amount is given' do
      it 'adds specified dish with quantity of 1 by default' do
        subject { Order.new(menu_double) }
        subject.add_item(dish)
        expect(subject.items).to include({name: dish, price: 10, quantity: 1})
      end
    end
    context 'when an amount is given' do
      it 'adds specified dish in specified quantity' do
        subject { Order.new(menu_double) }
        subject.add_item(dish, 3)
        expect(subject.items).to include({name: dish, price: 10, quantity: 3})
      end
    end
  end
end
