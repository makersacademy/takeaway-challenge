require 'order'

describe Order do
  subject(:order) {described_class.new}
  let(:menu_class) {double :menu_class, new: menu}
  let(:menu) {double :menu}
  let(:dish) {double :dish, to_sym: :dish}

  context '#select item (when dish is on the menu)' do
    before do
      allow(order).to receive(:check_menu).and_return(true)
    end
    it 'can select a specific item' do
      order.select_dish(dish)
      expect(order.show_basket).to(have_key(:dish))
    end
    it 'can select a specified amount of item' do
      order.select_dish(dish,2)
      expect(order.show_basket).to(have_value(2))
    end
  end
  describe 'error messages' do
    it '#select item -> raise error (if is not on the menu)' do
      expect{order.select_dish(dish)}.to raise_error("Not on the menu")
    end
  end
  context '#order_summary -> show basket and total price' do
    before do
      allow(order).to receive(:check_menu).and_return(true)
      order.select_dish("Pepperoni",2)
    end
    it 'totals the order' do
      expect(order.order_summary).to eq 18
    end
  end
end
