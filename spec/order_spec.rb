require 'order'
require 'byebug'

describe Order do

  subject(:order){ described_class.new(menu_klass: menu_klass) }
  let(:menu_klass) { double(:menu_klass, new: menu) }
  let(:menu) { double(:menu, display: {pasta=>4.3})}
  let(:pasta) { :pasta }

  describe '#see_menu' do
    it 'Shows a list of dishes with prices' do
      expect(menu).to receive(:display)
      order.display_menu
    end
  end
  describe '#take_order' do
    it 'keeps track of the dishes ordered' do
      expect(order.take_order(:pasta, 3)).to include(:pasta => 3)
    end
    it 'expects an error if dish is not available' do
      message = "That dish is not available"
      expect{ order.take_order(:chicken_wings, 3) }.to raise_error(message)
    end
    it 'expects an error when quantity invalid or not supplied' do
      message = "Quantity must be an integer"
      expect{ order.take_order(:pasta, "3") }.to raise_error(message)
    end
  end
  describe '#view_current_order' do
    it 'should display the current order' do
      expect(order.view_current_order).to be_a(Array)
    end
  end
  describe '#place order' do
    it 'should raise error if amount given is less than the total' do
      order.take_order(:pasta, 3)
      message = "Not enough money given"
      expect{order.place_order}.to raise_error(message)
    end
  end

end
