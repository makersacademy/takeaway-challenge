require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu, basket) }

  let(:menu) { double(:menu, show: shown_menu) }
  let(:basket) { double(:basket, add: "ok") }

  let(:shown_menu) { "Masala Dosa - £7.95" }
  let(:selection) { 'Masala Dosa' }

  describe '#show_menu' do
    it 'returns a list of dishes and their prices' do
      expect(takeaway.show_menu).to eq shown_menu
    end
  end

  describe '#order' do
    it 'lets user select a dish and an amount' do
      allow(menu).to receive(:includes_dish?).and_return true
      expect(basket).to receive(:add).with 'Masala Dosa', 3
      takeaway.order(selection, 3)
    end
    it 'confirms the order with the user' do
      allow(menu).to receive(:includes_dish?).and_return true
      expect(takeaway.order(selection, 5)).to eq "Added 5 x #{selection} to your order"
    end
    context 'dish is not on the menu' do
      it 'raises an error if dish is not on the menu' do
        allow(menu).to receive(:includes_dish?).and_return false
        expect { takeaway.order('Pizza') }.to raise_error 'That dish is not on the menu'
      end
    end
  end
  #
  # describe '#show_basket' do
  #   it 'returns all ordered dishes with the sum of their prices' do
  #     amount = 2
  #     takeaway.order(selection, amount)
  #     expect(takeaway.show_basket).to eq "#{amount} x #{selection} -- £#{amount * selection_price}"
  #   end
  # end
end
