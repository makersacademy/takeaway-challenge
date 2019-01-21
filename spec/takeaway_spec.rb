require 'takeaway'

describe Takeaway do
  it { is_expected.to respond_to(:show_menu).with(1).argument }
end
