require 'order'
require 'restaurant'

describe Order do
  it {is_expected.to be_instance_of(described_class)}

  it {is_expected.to respond_to(:menu)}
end

describe Restaurant do
  it {is_expected.to be_instance_of(described_class)}
end
