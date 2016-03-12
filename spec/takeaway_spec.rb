require 'takeaway'

describe TakeAway do
  it { is_expected.to respond_to(:read_menu) }

  it { is_expected.to respond_to(:basket) }

  it { is_expected.to respond_to(:order).with(1).argument}

  it { is_expected.to respond_to(:total) }

end
