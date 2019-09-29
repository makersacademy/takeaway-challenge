require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(order: order, menu: menu) }
  let(:menu) { double(:menu) }
  let(:order) { double(:order) }

end
