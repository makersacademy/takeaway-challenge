require 'order'
require 'menu'

describe Order do
  subject(:new_order) {described_class.new}
  let(:menu) { double :menu}
  let(:menu_item1) {double :menu_item1, :menu => {num: 1, name: "Milano", price: 19.99}}
  let(:menu_item2) {double :menu_item2, :menu => {num: 6, name: "American Hot", price: 16.99}}

  it 'should be initialized with a menu' do
    expect(new_order.menu).to be_an_instance_of(Menu)
  end

  it 'should be initialized with no food selected' do
    expect(new_order.selection).to be_empty
  end

  describe '#show_menu' do
    it 'should show the customer the menu' do
      expect(STDOUT).to receive(:puts).exactly(new_order.menu.menu.count).times
      new_order.show_menu
    end
  end

  describe '#select_item' do
    it 'should be received with 1 argument' do
      expect(new_order).to respond_to(:select_item).with(1).argument
    end

    it 'should allow the customer to select a menu item' do
      new_order.select_item(menu_item1.menu[:num])
      expect(new_order.selection).to include({num: 1, name: "Milano", price: 19.99})
    end
  end

  describe '#order_summary' do
    before do
      new_order.select_item(1)
      new_order.select_item(5)
      new_order.select_item(3)
      new_order.select_item(11)
    end

    it 'records total order' do
      expect(new_order.order_price).to eq(new_order.order_price)
    end

    it 'should give a summary of the order with price' do
      expect(new_order).to receive(:show_order)
      expect(new_order).to receive(:total_price)
      expect(new_order).to receive(:print_total)
      new_order.order_summary
    end
  end

  context 'giving quantaties of items in the order' do
    before do
      new_order.select_item(1)
      new_order.select_item(5)
      new_order.select_item(1)
      new_order.select_item(1)
      new_order.order_summary
    end

    it 'should give the quanteties of the items orded' do
      expect(new_order.ordered_selection.values).to include(3, 1)
    end
  end

end
