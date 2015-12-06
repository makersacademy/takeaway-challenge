require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order_klass: order_klass) }
  let(:menu) { double(:menu, dishes: {burger: 1.88, beef: 2.34, fries: 1.10}) }
  let(:order_klass) { double(:order, new: order) }
  let(:order) { double(:order) }

  describe '#read_menu' do
    it 'should return what is present on the menu' do
      contents = {burger: 1.88, beef: 2.34, fries: 1.10}
      expect(takeaway.read_menu).to include contents
    end
  end

  describe '#order' do
    it 'should tell order to add an item' do
    end
  end

end
