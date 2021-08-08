require "./lib/takeaway.rb"

describe Takeaway do

  it { is_expected.to respond_to(:order).with(1).argument }
  
end
