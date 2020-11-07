require 'order'

describe Order do
  describe '#see_menu' do
    it 'returns a Hash of dishes' do
      expect(subject.see_menu).to be_instance_of(Hash)
    end

    describe '#add_to_basket' do
      it 'adds a menu item to the basket' do
        expect { subject.add_to_basket('curry goat', 3) }.to change { subject.basket.length }.by(1)
      end
    end
  end
end