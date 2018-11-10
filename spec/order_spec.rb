require 'order'

describe Order do
  let(:order) { Order.new }

  it { is_expected.to respond_to(:check_menu).with(1).argument }

end