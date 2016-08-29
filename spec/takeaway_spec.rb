require 'takeaway'

=begin
start_order -> create an Order instance
checkout -> check total i.e. create Verify instance
send_confirm -> send SMS i.e. create Confirmation instance
=end
describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:order_class){double :order_class, new: order}
  let(:order) {double :order, order_summary: 18}
  let(:menu) {double :menu}
  let(:dish) {double :dish}
  let(:quantity) {double :quantity}

  describe '#start_order' do
    it 'instantiates an order when #start_order called' do
      takeaway.start_order
      expect(takeaway.current_order).to_not be nil
    end
  end

end
