require 'order'

describe Order do
  let(:order) { Order.new }

  it { is_expected.to respond_to(:check_menu).with(1).argument }
  it { is_expected.to respond_to(:select_item).with(2).argument }
  it { is_expected.to respond_to(:check_order) }



end