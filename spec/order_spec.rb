require 'order'

describe Order do

  it { is_expected.to respond_to(:place_order).with(2).arguments }

  it { is_expected.to respond_to :total }

end
