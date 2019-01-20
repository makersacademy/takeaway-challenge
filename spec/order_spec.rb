require 'order'

describe Order do
  it { is_expected.to respond_to :total_price }
end
