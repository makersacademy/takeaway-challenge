require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  it { is_expected.to respond_to(:contains?).with(1).argument }
  it { is_expected.to respond_to(:price).with(1).argument }

end