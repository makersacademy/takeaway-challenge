require './lib/takeaway'
describe Takeaway do
  let(:menu) { double :menu }
  let(:order) { double :order }
  describe '#view_menu' do
    it 'can view a menu of dishes' do
      allow(menu).to receive(:view_dishes) { menu }
      subject.view_menu
    end
  end

  describe '#add_to_order' do
    it 'can order dishes from the menu' do
      allow(order).to receive(:add).and_return("Pizza", 18, 1)
      subject.add_to_order("Pizza", 18, 1)
    end

    it 'will raise an error if a dish is not on the menu' do
      expect { subject.add_to_order("Lobser Linguni", 30, 1) }.to raise_error "Dish unavailable"

    end
  end
end
