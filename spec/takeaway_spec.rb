require 'takeaway'

describe Takeaway do

  it { is_expected.to respond_to(:show_menu) }

  it { is_expected.to respond_to(:order).with(1).argument}

  

end
