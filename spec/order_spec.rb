require 'order'

describe Order do
  subject { described_class.new }

  it { is_expected.to respond_to(:add_to_order).with(2).arguments }
end
