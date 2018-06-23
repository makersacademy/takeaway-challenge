require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu, basket) }

  let(:menu) { double(:menu, show: shown_menu, includes_dish?: true, price: 7.95) }
  let(:basket) { double(:basket, add: 'added', show: basket_content) }
  let(:shown_menu) { 'Dosa - £7.95' }
  let(:basket_content) { "3 x Dosa - £15.90\n2 x Chapatti - £5.40\n" }

  describe '#show_menu' do
    it 'returns a list of dishes and their prices' do
      expect(takeaway.show_menu).to eq shown_menu
    end
  end

  describe '#order' do
    it 'send selected dish, amount and price to basket' do
      allow(menu).to receive(:includes_dish?).and_return true
      expect(basket).to receive(:add).with 'Dosa', 3, 7.95
      takeaway.order('Dosa', 3)
    end
    it 'confirms the order with the user' do
      allow(menu).to receive(:includes_dish?).and_return true
      expect(takeaway.order('Dosa', 5)).to eq "Added 5 x Dosa to your order"
    end
    context 'dish is not on the menu' do
      it 'raises an error if dish is not on the menu' do
        allow(menu).to receive(:includes_dish?).and_return false
        expect { takeaway.order('Pizza') }.to raise_error 'That dish is not on the menu'
      end
    end
  end

  describe '#show_basket' do
    it 'returns all ordered dishes with the sum of their prices' do
      takeaway.order('Dosa', 3)
      takeaway.order('Chapatti', 2)
      expect(takeaway.show_basket).to eq basket_content
    end
  end
end
