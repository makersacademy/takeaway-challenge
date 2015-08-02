require 'takeaway'

describe Takeaway do

  it { is_expected.to respond_to(:display_menu) }

  it { is_expected.to respond_to(:select_items).with(2).arguments }
end
