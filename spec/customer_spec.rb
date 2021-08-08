require 'customer'

describe Customer do
  it { is_expected.to respond_to :order }
  it { is_expected.to respond_to :clear_order }
end
