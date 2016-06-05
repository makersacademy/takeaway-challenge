require 'checkout'

describe Checkout do
  let(:order) { double :order}
  let(:total_price) {double :total_price}
  subject(:checkout) { described_class.new(order, total_price) }

  describe 'responds to' do
    it { is_expected.to respond_to(:order_summery)}
  end
end
