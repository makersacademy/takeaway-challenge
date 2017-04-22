require './lib/order'

describe Order do
  alias_method :order, :subject

  it { is_expected.to respond_to(:add).with(1).argument }
  it { is_expected.to respond_to(:total).with(1).argument }


end
