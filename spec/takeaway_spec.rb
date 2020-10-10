require './lib/takeaway'
describe Takeaway do
  let(:menu) { double :menu }
  describe '#view_menu' do
    it 'can view a menu of dishes' do
      allow(menu).to receive(:view_dishes) { menu }
      subject.view_menu
    end
  end
end
