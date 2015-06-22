require 'order'

describe Order do

  it { is_expected.to respond_to :check_total }

  it { is_expected.to respond_to :pay }

  it { is_expected.to respond_to :place }

end