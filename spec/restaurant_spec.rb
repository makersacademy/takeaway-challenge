require 'restaurant'
describe Restaurant do
  subject(:restaurant) {Restaurant.new}
  let (:test_order) {double :test_order}
  let(:menu) {double :menu}
  #let (:order) {instance_double :order, ["diet coke",1] }
  context "Method check" do
    it {is_expected.to respond_to :accept_order}


  end
  describe "#accept_order" do
    it 'should accept the order' do
      allow(restaurant).to receive(:check_on_menu?).with(test_order).and_return true
      allow(test_order).to receive(:order).and_return test_order
      restaurant.accept_order(test_order)
      expect(@order_accepted).to eq test_order
    end
    it 'only accepts items on the menu' do
      allow(restaurant).to receive(:check_on_menu?).with(test_order).and_return false
      expect{restaurant.accept_order(test_order)}.to raise_error "item not available"
    end
     # it 'raises an error if item is not on the menu' do
     #  expect{ new_order.add_item_qty("coke",3) }.to raise_error "item not available"
     # end
   end
end