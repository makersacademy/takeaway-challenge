require 'takeaway'
require 'basket'

RSpec.describe Takeaway do
  let(:menu) { double :menu, display_menu: {} }
  let(:basket) { double(:basket, place_order: {}, sum_order: "Sum") }
  subject { described_class.new(basket) }

  describe '#order method' do
    it 'expects Basket to place order ' do
      expect(basket).to receive(:place_order).and_return({})
      subject.order
    end
  end

  describe '#total method' do
    it 'expects Basket to add up the order ' do
      expect(basket).to receive(:sum_order).and_return("Sum")
      subject.total
    end
  end

  describe '#read_menu method' do
    it 'returns the menu' do
      allow(menu).to receive(:display_menu).and_return({})
      expect(subject.read_menu).to eq(Menu::MENU)
    end
  end
end
