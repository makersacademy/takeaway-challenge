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
      allow(order).to receive(:add).and_return("dish", 20, 1)
      subject.add_to_order("dish", 20, 1)
    end
  end
end
