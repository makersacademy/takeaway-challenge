require 'delivery'

describe Delivery do
  it { is_expected.to respond_to(:confirm) }
end
