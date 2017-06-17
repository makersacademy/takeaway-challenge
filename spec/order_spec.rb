require 'order'

describe Order do

  describe '#initialize' do
    let(:menu) { double :menu }

    subject(:order) { described_class.new(menu) }

    it 'is initialized with an empty entries array' do
      expect(order.entries).to be_empty
    end

    it 'is initialized with a menu' do
      expect(order.menu).not_to be_nil
    end
  end
end
