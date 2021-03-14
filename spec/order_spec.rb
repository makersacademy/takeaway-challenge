require 'order'

describe Order do
  let(:dish) { "Hamburger" }
  let(:menu_double) { double("Menu", dishes: [{ name: "Hamburger", price: 10 },
    { name: "Chips", price: 4 },
    { name: "Orange Juice", price: 2 }])
  }

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
        expect(subject.items).to include({ name: dish, price: 10, quantity: 1 })
      end
    end
    context 'when an amount is given' do
      it 'adds specified dish in specified quantity' do
        subject { Order.new(menu_double) }
        subject.add_item(dish, 3)
        expect(subject.items).to include({ name: dish, price: 10, quantity: 3 })
      end
    end
  end

  describe '#total' do
    context 'when no items have been added' do
      it 'returns 0' do
        expect(subject.total).to eq(0)
      end
    end
    context 'when items have been added' do
      it "returns the sum of all items' prices" do
        subject.add_item("Hamburger")
        subject.add_item("Chips", 2)
        expect(subject.total).to eq(18)
      end
    end
  end

  describe '#display_details' do
    it 'outputs list of ordered items with prices and total' do
      subject.add_item("Hamburger", 2)
      expect { subject.display_details }.to output(/Hamburger/ && /unit price/ && /10/ && /GBP/ && /total price/ && /20/).to_stdout
    end
  end
end
