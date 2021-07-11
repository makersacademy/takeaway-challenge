require 'takeaway'
require 'basket'

RSpec.describe Takeaway do
  let(:menu) { double :menu, display_menu: {} }
  let(:basket) { double(:basket, place_order: [], sum_order: "Sum") }
  subject { described_class.new(basket) }

  describe '#order method' do
    it 'expects Basket to do 2 things ' do
      expect(basket).to receive(:place_order)
      expect(basket).to receive(:sum_order)
      subject.order
    end
  end

  describe '#read_menu method' do
    it 'returns the menu' do
      allow(menu).to receive(:display_menu).and_return({})
      expect(subject.read_menu).to eq(Menu::MENU)
    end
  end
end
