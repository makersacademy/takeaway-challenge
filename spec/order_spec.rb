require 'order'
require 'byebug'

describe Order do

  subject(:order){ described_class.new(menu_klass: menu_klass) }
  let(:menu_klass) { double(:menu_klass, new: menu) }
  let(:menu) { double(:menu) }
  let(:dish1) { double(:dish1) }

  describe '#see_menu' do
    it 'Shows a list of dishes with prices' do
      expect(menu).to receive(:list)
      order.see_menu
    end
  end

  describe '#take_order' do
    it 'keeps track of the dishes ordered' do
      allow(menu).to receive(:include?).and_return(true)
      expect(order.take_order(dish: :pasta, quantity: 3)).to include(:pasta => 3)
    end
    it 'expects an error if dish is not available' do
      allow(menu).to receive(:include?).and_return(false)
      message = "That dish is not available"
      expect{ order.take_order(dish: :pasta, quantity: 3) }.to raise_error(message)
    end
    it 'expects an error when quantity invalid or not supplied' do
      allow(menu).to receive(:include?).and_return(true)
      message = "Quantity must be an integer"
      expect{ order.take_order(dish: :pasta, quantity: "3") }.to raise_error(message)
    end
  end
end
