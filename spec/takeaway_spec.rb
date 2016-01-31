require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu, order) }
  let(:menu) { double :menu, display_menu: {onion_bhaji: 2.95, chicken_tikka_masala: 7.95, naan: 1.95},has_dish?: true }
  let(:dishes) { {chicken_tikka_masala: 1, naan: 2} }
  let(:order) {double :order, add: dishes, basket: dishes, order_total: 3}

  describe '#read_menu' do
    it 'displays a list of dishes with prices' do
      expect(takeaway.read_menu).to eq menu.display_menu
    end
  end

  describe '#select_dishes' do
    it { is_expected.to respond_to(:select_dishes).with(1).argument }

    it 'returns the dishes that were selected' do
      expect(takeaway.select_dishes(dishes)).to eq dishes
    end
  end

  describe '#checkout' do
    it 'gives a total of the dishes ordered' do
      takeaway.select_dishes(dishes)
      expect(takeaway.checkout).to eq 'You\'ve ordered 3 items.'
    end
  end

  describe '#confirm_order' do
    it 'checks that the total matches the sum of dishes ordered' do
      allow(order).to receive(:check_order).and_return false
      takeaway.select_dishes(dishes)
      expect{ takeaway.confirm_order(4) }.to raise_error 'Total number of dishes does not match. Please check again.'
    end
  end
end