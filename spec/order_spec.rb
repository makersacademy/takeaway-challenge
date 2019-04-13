require 'order'

describe Order do
  # let (:menu) { double :menu }
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

      current_order = []
      menu = Menu.new.dishes
      current_order << menu.detect {|dish| dish["Spare Ribs"] }
      expect(subject.current_order).to eq [{ dish: 'Spare Ribs', price: 6.00 }]

    end
  end
end
