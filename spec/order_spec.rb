require 'order'

describe Order do
  subject(:order) { described_class.new }

  it { expect(order.current_order).to be_empty }



end
