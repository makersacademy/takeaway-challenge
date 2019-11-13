require 'Takeaway'
require 'menu'
describe Takeaway do
  it { is_expected.to be_instance_of(described_class) }

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
 it { is_expected.to respond_to(:select).with(1).argument }
end
