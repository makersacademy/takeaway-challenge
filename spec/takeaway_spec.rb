require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  let(:order_class) { double :order_class }

  describe '#start_order' do
    let(:takeaway) { Takeaway.new(menu, order_class) }

    it 'creates an instance of the Order class' do
      expect(order_class).to receive(:new)
      takeaway.start_order
    end
  end

  describe '#see_menu' do
    let(:takeaway) { Takeaway.new(menu, order_class) }

    it 'calls the see_menu method in the Menu class' do
      expect(menu).to receive(:see_menu)
      takeaway.see_menu
    end
  end
end