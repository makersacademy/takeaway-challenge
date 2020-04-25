require 'restaurant'

describe Restaurant do
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:menu) }
end
