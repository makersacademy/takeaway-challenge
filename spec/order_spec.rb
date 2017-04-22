require './lib/order'
require './lib/restaurant'

describe Order do
  alias_method :order, :subject
  let(:menu) { Restaurant::MENU }

  it { is_expected.to respond_to(:add).with(1).argument }

end
