require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new menu, order_klass}
  let(:menu) {double :menu}
  let(:dish) {double :dish}
  let(:order_klass) {double :Order, new: order}
  let(:order) {double :order}

  describe '#select_item' do
    it '> should send add item method to order class' do
      allow(takeaway).to receive(:on_menu?).and_return(true)
      expect(order).to receive(add_item).with(dish)
      takeaway.select_item(dish)
    end

    it '> should raise error if item not on menu' do
      message = "#{dish} is not on the menu."
      allow(takeaway).to receive(:on_menu?).and_return(false)
      allow(order).to receive(:add_item).with(dish)
      expect{takeaway.select_item(dish)}.to raise_error message
    end

  end

  describe '#confirm_order' do

    before do
      allow(order).to receive(:add_item).with(dish)
      allow(order).to receive(:calc_total).and_return(5)
      allow(takeaway).to receive(:on_menu?).and_return(true)
    end

    it '> should add item to order basket if it is on the menu' do
      takeaway.select_item(dish)
      expect(takeaway.confirm_order(5)).to eq(true)
    end

    it '> should raise error if argument does not match order total' do
      message = "Order does not match total of #{order.calc_total}"
      takeaway.select_item(dish)
      expect{takeaway.confirm_order(6)}.to raise_error message
    end
  end

end
