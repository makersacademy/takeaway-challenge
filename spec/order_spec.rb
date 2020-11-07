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

      it 'raises error if quantity is a negative number' do
        expect { subject.add('curry goat', -1) }.to raise_error('Quantity must be 1 or greater')
      end
    end

    describe '#review' do
      it 'prints out basket items, quantities, subtotals and total' do
        subject.add('beef patty', 1)
        subject.add('fried dumpling', 2)
        expect { subject.review }.to output(
          "Your order\nx1 beef patty, £2.50\nx2 fried dumpling, £3.00\nTotal: £5.50\n"
          ).to_stdout
      end
    end
  end
end