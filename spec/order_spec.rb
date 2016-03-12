require 'order'

describe Order do
  let(:menu) { double :menu, list: {MENU_ITEM => MENU_ITEM_PRICE}, price: MENU_ITEM_PRICE }
  let(:sms_sender) { double :sms_sender }
  subject(:order) { described_class.new(menu, sms_sender) }
  MENU_ITEM = 'Cheese sandwich'
  MENU_ITEM_PRICE = 3
  ITEM_QUANTITY = rand(1..5)

  describe '#initialize' do
    it 'has an empty basket' do
      expect(order.basket).to be_empty
    end
    it 'has a total of 0' do
      expect(order.total).to be_zero
    end
  end

  describe '#view_menu' do
    it 'displays menu' do
      expect(menu).to receive(:list)
      order.view_menu
    end
  end

  describe '#add_to_basket' do

    before do
      order.add_to_basket(MENU_ITEM, ITEM_QUANTITY)
    end

    it 'should add menu item to basket' do
      expect(order.basket).to include(MENU_ITEM => ITEM_QUANTITY)
    end
    it 'raises error when trying to select item that is not on the menu' do
      message = Order::NOT_ON_MENU_ERROR
      expect{ order.add_to_basket('Falafel') }.to raise_error message
    end
    it 'should add cost of items to order cost' do
      expect(order.total).to eq (MENU_ITEM_PRICE*ITEM_QUANTITY)
    end
  end

  describe '#checkout' do

    before do
      order.add_to_basket(MENU_ITEM)
    end

    it 'raises error if estimated cost is incorrect' do
      estimated_total = rand(0..MENU_ITEM_PRICE-1)
      message = Order::INCORRECT_ESTIMATED_TOTAL_ERROR
      expect{ order.checkout(estimated_total) }.to raise_error message
    end
    it 'raises error if basket is empty' do
      order = described_class.new(menu)
      message = Order::EMPTY_BASKET_ERROR
      expect{ order.checkout(0) }.to raise_error message
    end
    it 'sends an SMS confirmation' do
      expect(sms_sender).to receive(:send_sms)
      order.checkout(MENU_ITEM_PRICE)
    end
  end
end
