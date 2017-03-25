require 'order'

describe Order do
  let(:menu) { double :menu }
  subject(:order) { described_class.new(:menu) }

  describe '#initialize' do
    it 'has a menu' do
      expect(order.menu).to eq :menu
    end
  end
end
