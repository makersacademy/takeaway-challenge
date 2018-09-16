describe SMSSender do
  
  let(:menu) { double :menu }
  let(:order) { double :order }
  subject(:takeaway) { described_class.new(menu, order) }

  describe '#send_order_confirmation' do

  end

end
