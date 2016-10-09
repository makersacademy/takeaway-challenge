require 'takeaway'
require 'menu'
require 'order'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:new_order) {double :new_order}
  let(:menu_item1) {double :menu_item1, :menu => {num: 1, name: "Milano", price: 19.99}}
  let(:menu_item2) {double :menu_item2, :menu => {num: 6, name: "American Hot", price: 16.99}}

  it 'should be initialized with a menu' do
    expect(takeaway.order).to be_an_instance_of(Order)
  end

  describe '#menu_list' do
    it 'show the menu' do
      expect(STDOUT).to receive(:puts).exactly(takeaway.order.menu.menu.count).times
      takeaway.menu_list
    end

  end

  describe '#choose_item' do

    it 'should take 1 argument' do
      expect(takeaway).to respond_to(:choose_item).with(1).argument
    end

    it 'should allow customer to choose an item from the menu' do
      takeaway.choose_item(menu_item1.menu[:num])
      expect(takeaway.order.selection).to include({num: 1, name: "Milano", price: 19.99})
    end
  end

  describe '#order_info' do
    before do
      takeaway.choose_item(menu_item1.menu[:num])
      takeaway.choose_item(menu_item2.menu[:num])
    end

    it 'shows total price of order' do
      takeaway.order_info
      expect(takeaway.order.order_price).to eq(menu_item1.menu[:price] + menu_item2.menu[:price])
    end
  end

  describe '#place_order' do
    before do
      takeaway.choose_item(menu_item1.menu[:num])
      takeaway.choose_item(menu_item2.menu[:num])
      takeaway.choose_item(menu_item1.menu[:num])
    end

    it 'show the order info' do
      allow(takeaway.order).to receive(:order_price) {56.97}
      expect(takeaway).to receive(:order_info)
      takeaway.place_order
    end

    context 'incorrect total price' do
      it 'raise an error if the total price is incorrect' do
        allow(takeaway.order).to receive(:order_price) {59.97}
        message = "The total order price is different from the dishes on the order"
        expect{takeaway.place_order}.to raise_error message
      end
    end
  end
end
