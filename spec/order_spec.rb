require 'order'

describe Order do
  subject(:order) { described_class.new(menu: menu)}
  let(:item) {double :item}
  let(:price) {double :price}
  let(:menu) {double :menu, show: [item=>price]}



  describe '#display_menu' do
    it 'shows the menu' do
      expect(menu).to receive(:read)
      order.show_menu
    end
  end

  describe '#add' do
    it 'raise error if dish not on menu' do
      message = "That's not on this menu."
      expect{order.add(item)}.to raise_error message
    end

    it 'adds dish to order' do
      order.add(item)
      p order.menu_hash
      expect(order.order).to eq [item]
    end

    xit 'adds order to order list' do
      add(item, 2)
      expect(order.display_menu).to eq
    end
  end
end
