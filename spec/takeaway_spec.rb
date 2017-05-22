require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu, order) }
  let(:order) { double :order, cart: { 'wings' => 2, 'chicken' => 1 } }
  let(:menu) { double :menu }
  let(:dish) { double :dish, name: 'chicken', price: 7 }
  let(:sms) { double :sms }

  describe '#read_menu' do
    it { is_expected.to respond_to :read_menu }

    it 'let the customer read the dishes present on the menu' do
      allow(menu).to receive(:show_menu) { '1. wings, £7.00' }
      expect(takeaway.read_menu).to eq '1. wings, £7.00'
    end
  end

  describe '#add_to_order' do
    it { is_expected.to respond_to(:add_to_order).with(2).arguments }

    it 'adds the desired product from the menu to the cart' do
      allow(order).to receive(:add_product).with('wings', 2) { '2 x wings added to your cart' }
      expect(takeaway.add_to_order('wings', 2)).to eq '2 x wings added to your cart'
    end
  end

  describe '#check_total' do
    it 'shows the order total' do
      allow(order).to receive(:total) { 19.00 }
      expect(takeaway.check_total).to eq 19.00
    end
  end

  describe '#checkout'
    it 'sends a order confirmation text message' do
      allow(sms).to receive(:send).with('test message')
    end
end
