require 'restaurant'

describe Restaurant do
  let(:menu) { double :menu, display: nil }
  let(:order_klass) { double :order_klass, new: order }
  let(:order) { double :order }
  subject(:restaurant) { described_class.new(menu, order_klass) }

  describe '#read_menu' do
    it 'displays the menu' do
      expect(restaurant.read_menu).to eq menu.display
    end
  end

  # describe '#order' do
  #   it 'creates new order instance' do
  #     restaurant.order pizza
  #     expect(restaurant.order).to eq order
  #   end
  # end
end
