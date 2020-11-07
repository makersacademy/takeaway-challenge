require 'order'

describe Order do
  describe '#see_menu' do
    it 'returns a Hash of dishes' do
      expect(subject.see_menu).to be_instance_of(Hash)
    end

    describe '#add' do
      it 'adds a menu item to the €basket array' do
        expect { subject.add('curry goat', 1) }.to change { subject.basket.length }.by(1)
      end

      it 'raises error if user enters item that is not on the menu' do
        expect { subject.add('pizza', 1) }.to raise_error('Please choose valid menu option')
      end

      it 'raises error if user-entered-quantity is not a number' do
        expect { subject.add('curry goat', '1') }.to raise_error('Quantity must be a number')
      end
    end
  end
end