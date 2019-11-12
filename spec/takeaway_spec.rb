require './lib/takeaway.rb'

describe Takeaway do
  it { is_expected.to be_instance_of(described_class) }

  it { is_expected.to respond_to(:menu) }
end
