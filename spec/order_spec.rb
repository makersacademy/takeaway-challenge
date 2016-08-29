require 'order'

describe Order do
  subject(:order) {described_class.new}
  let(:menu_class) {double :menu_class, new: menu, on_menu?: true}
  let(:menu) {double :menu}
  let(:dish) {double :dish}

  # it 'initializing an order should inject menu' do
  #   expect(menu_class).to receive(:new)
  #   order
  # end
  describe '#select_dish' do
    it 'can select specific item' do
      order.select_dish(dish)
      expect(order.basket).to include dish
    end
    it 'checks if item on menu list' do
      expect(menu).to receive(:on_menu?).with(dish)
      order.select_dish(dish)
    end
  end
end
