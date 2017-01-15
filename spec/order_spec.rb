require 'order'

describe Order do
  subject(:order) {described_class.new(Menu)}
  let (:menu) { double :menu}

  context "#ordering" do
    it 'is initialised with an empty order list' do
      expect(order.order_items).to eq []
    end

    it 'can read the items from the menu' do
      expect(order.read_menu).to eq menu.view
    end
  end
end
