require 'order'

describe Order do
  describe '#see_menu' do
    it 'prints the available dishes and their prices' do
      expect { subject.see_menu }.to output.to_stdout
    end

    describe '#add' do
      it 'adds a menu item to the basket hash' do
        expect { subject.add('curry goat', 1) }.to change { subject.basket.length }.by(1)
      end

      it 'raises error if user enters item that is not on the menu' do
        expect { subject.add('pizza', 1) }.to raise_error('Please choose valid menu option')
      end

      it 'raises error if quantity is not a valid integer' do
        expect { subject.add('curry goat', '1') }.to raise_error('Quantity must be a valid integer')
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

    describe '#place_order' do
      it 'calls the process_order method' do
        expect(subject).to receive(:process_order)
        subject.place_order('Malachi', ENV['MOBILE_NUMBER'])
      end
    end
  end
end