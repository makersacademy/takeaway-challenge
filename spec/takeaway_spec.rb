require 'takeaway'
require 'menu'
require 'order'
require 'message'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:new_order) {double :new_order}
  let(:menu_item1) {double :menu_item1, :menu => {num: 1, name: "Milano", price: 19.99}}
  let(:menu_item2) {double :menu_item2, :menu => {num: 6, name: "American Hot", price: 16.99}}

  it 'should start a new' do
    takeaway.new_order
    expect(takeaway.order).to be_an_instance_of(Order)
  end

  describe '#place_order' do
    let(:message) {double :message}
    before do
      takeaway.new_order
      takeaway.order.select_item(1)
      takeaway.order.select_item(6)
      takeaway.order.select_item(1)
    end

    it 'should send a text confirming the order' do
      allow(takeaway.order).to receive(:correct_total?) {true}
      expect(message).to receive_messages(send_message: true)
      takeaway.place_order(message)
    end
  end

  context '#incorrect total order price' do
    before do
      takeaway.new_order
      takeaway.order.select_item(menu_item1.menu[:num])
      takeaway.order.select_item(menu_item2.menu[:num])
      takeaway.order.select_item(menu_item1.menu[:num])
    end

    it 'raise an error if the total price is incorrect' do
      allow(takeaway.order).to receive(:order_price) {59.97}
      message = "The total order price is different from the dishes on the order"
      expect{takeaway.place_order}.to raise_error message
    end
  end
end
