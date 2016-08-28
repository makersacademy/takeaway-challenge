require 'order'

describe Order do

subject(:order) {described_class.new}
let(:menu) {double :menu}


  describe '#select_dishes' do
    it 'selects dishes from the list' do
      allow(menu).to receive(:display_dishes)
      menu.display_dishes
      expect(order).to respond_to(:select_dishes).with(2).arguments
    end
  end
end
