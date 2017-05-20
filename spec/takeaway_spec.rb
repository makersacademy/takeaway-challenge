require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double :menu }
  let(:dish) { double :dish, name: 'chicken', price: 7 }


  describe '#read_menu' do
    it { is_expected.to respond_to :read_menu }

    it 'let the customer read the dishes present on the menu' do
      allow(menu).to receive(:show_menu) { '1. wings, £7.00' }
      expect(takeaway.read_menu).to eq '1. wings, £7.00'
    end
  end

  describe '#order' do
    it { is_expected.to respond_to(:order).with(2).arguments }

    it 'let select the desired product from the menu' do
      expect(takeaway.order('chicken', 2)).to eq '2 x wings added to your cart'
    end
  end
end
