require 'controller'

describe Controller do
  let(:controller) { Controller.new }
  let(:order)      { double(:order) }
  let(:menu)       { double(:menu) }
  let(:item1)      { { name: 'test dish 1', price: '£1.01', veggie: nil } }
  TEST_MENU_PATH = './spec/test.csv'

  describe '#new_order' do
    it 'should create a new order' do
      controller
      expect(Order).to receive(:new)
      controller.new_order
    end
  end

  describe '#select_menu' do
    it 'should set the current menu to the given menu' do
      controller
      expect(Menu).to receive(:new).with(TEST_MENU_PATH)
      controller.select_menu(TEST_MENU_PATH)
    end
  end

  describe '#show_menu' do
    it 'should display the current menu, with prices' do
      controller.instance_variable_set(:@current_menu, menu)
      expect(menu).to receive(:list_prices)
      controller.show_menu
    end
  end

  describe '#show_order' do
    it 'should display the current order' do
      controller.instance_variable_set(:@current_order, order)
      expect(order).to receive(:list)
      expect(order).to receive(:print_total)
      controller.show_order
    end
  end

  describe '#add_to_order' do
    it 'should add an item to order, based on menu number' do
      controller.instance_variable_set(:@current_menu, menu)
      controller.instance_variable_set(:@current_order, order)
      allow(menu).to receive(:select).and_return(item1)
      expect(order).to receive(:add).with(item1)
      controller.add_to_order(1)
    end
  end
end
