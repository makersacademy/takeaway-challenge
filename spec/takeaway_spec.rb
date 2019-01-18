require 'takeaway'

RSpec.describe Takeaway do
  it { is_expected.to respond_to(:read_menu) }
  it { is_expected.to respond_to(:order).with(2).arguments }
end