require 'order_dispatch'

describe OrderDispatch do
  subject(:dispatch) { described_class.new }

  describe '#new_order' do
    it { is_expected.to respond_to(:new_order).with(1).argument }
  end
end
