require 'takeaway'

=begin
start_order -> create an Order instance
complete_order -> check total i.e. create Verify instance
send_confirm -> send SMS i.e. create Confirmation instance
=end
describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:order_class){double :order_class, new: order}
  let(:order) {double :order, checkout: nil, total: 1}

  it 'instantiates an order when #start_order called' do
    expect(order_class).to receive(:new)
    takeaway.start_order
  end
  describe '#complete_order calls checkout and verifies total' do
    it 'checks checkout called when call #complete_order' do
      expect(@order).to receive(:checkout)
      takeaway.complete_order
    end
  end
end
