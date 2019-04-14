require 'order'

describe Order do
  # let (:menu) { double :menu }
  let (:order) {subject}
  describe '#view_menu' do
    it 'returns the menu' do

      # allow(menu).to receive(:dishes).and_return([
      #   { dish: 'Spare Ribs', price: 6.00 },
      #   { dish: 'Seaweed', price: 4.50 },
      #   { dish: 'Half Duck', price: 20.00 },
      #   { dish: 'Beef in Black Bean Sauce', price: 7.50 },
      #   { dish: 'Kung Po Chicken', price: 6.50 },
      #   { dish: 'Chicken Balls', price: 6.30 },
      #   { dish: 'Special Fried Rice', price: 5.60 },
      #   { dish: 'Beef Chow Mein', price: 6.00 },
      #   { dish: 'Chips', price: 2.00 }
      # ])
      expect(subject.view_menu).to eq Menu.new.dishes

    end
  end

  describe '#dish' do
    it 'takes users dish choice' do
      allow(subject).to receive(:dish).and_return("Spare Ribs")
      expect(subject.dish).to eq("Spare Ribs")
    end
  end

  describe '#quantity' do
    it 'allows user to input quantity of ordered dish' do
      allow(subject).to receive(:quantity).and_return(1)
      expect(subject.quantity).to eq(1)
    end
  end

  describe '#add_to_order' do
    it 'records the current order' do
      # allow(menu).to receive(:dishes).and_return([
      #   { dish: 'Spare Ribs', price: 6.00 },
      #   { dish: 'Seaweed', price: 4.50 },
      #   { dish: 'Half Duck', price: 20.00 },
      #   { dish: 'Beef in Black Bean Sauce', price: 7.50 },
      #   { dish: 'Kung Po Chicken', price: 6.50 },
      #   { dish: 'Chicken Balls', price: 6.30 },
      #   { dish: 'Special Fried Rice', price: 5.60 },
      #   { dish: 'Beef Chow Mein', price: 6.00 },
      #   { dish: 'Chips', price: 2.00 }
      # ])
      dish = "Spare Ribs"
      quantity = 1
      expect(subject.add_to_order(dish, quantity)).to eq ["Spare Ribs"]

    end
  end
end
