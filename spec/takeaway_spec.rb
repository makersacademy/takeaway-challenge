require 'takeaway'

=begin
start_order -> create an Order instance
checkout -> check total i.e. create Verify instance
send_confirm -> send SMS i.e. create Confirmation instance
=end
describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:order_class){double :order_class, new: order}
  let(:order) {double :order, select_dish: true, order_summary: 18, basket: {dish => quantity}, check_menu: true}
  let(:menu) {double :menu}
  let(:dish) {double :dish}
  let(:quantity) {double :quantity}

  describe '#start_order' do
    it 'instantiates an order when #start_order called' do
      takeaway.start_order
      expect(takeaway.current_order).to_not be nil
    end
  end

  describe '#order_food - delegates to Order class' do
    it 'should allow orders to be made' do
      expect(takeaway.current_order).to receive(:select_dish).with(dish, quantity)
      takeaway.order_food(dish, quantity)
    end
  end

end
