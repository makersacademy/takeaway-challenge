require 'takeaway'

describe Takeaway do

  it { is_expected.to respond_to(:show_dishes) }

  it { is_expected.to respond_to(:place_order).with(1).argument }

end
