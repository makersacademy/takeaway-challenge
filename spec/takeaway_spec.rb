require 'takeaway'

describe Takeaway do
  it { is_expected.to respond_to(:menu) }
  it { is_expected.to respond_to(:place_order) }
  it { is_expected.to respond_to(:check_order) }
end