require 'takeaway'

describe TakeAway do
  it { is_expected.to respond_to(:view_menu) }
  it { is_expected.to respond_to(:add_to_order) }
  it { is_expected.to respond_to(:check_order) }
  it { is_expected.to respond_to(:submit_order) }
end
