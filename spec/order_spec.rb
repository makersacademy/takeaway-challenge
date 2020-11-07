require 'order'

describe Order do
  describe '#see_menu' do
    it 'returns a Hash of the available dishes' do
      expect(subject.see_menu).to be_instance_of(Hash)
    end

    describe '#add' do
      it 'adds a menu item to the basket hash' do
        expect { subject.add('curry goat', 1) }.to change { subject.basket.length }.by(1)
      end

      it 'raises error if user enters item that is not on the menu' do
        expect { subject.add('pizza', 1) }.to raise_error('Please choose valid menu option')
      end

      it 'raises error if quantity is not a number' do
        expect { subject.add('curry goat', '1') }.to raise_error('Quantity must be a number')
      end
    end

    describe '#check_order' do
      it 'prints out order items, quantities and total' do
        subject.add('beef patty', 1)
        subject.add('fried dumpling', 2)
        expect { subject.check_order }.to output(
          "Your order\nx1 beef patty, £2.50\nx2 fried dumpling, £3.00\nTotal: £5.50\n"
          ).to_stdout
      end
    end
  end
end