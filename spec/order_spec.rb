require 'order'

describe Order do
  # let(:in_station){ double :in_station }
  it { is_expected.to respond_to :total }
end
