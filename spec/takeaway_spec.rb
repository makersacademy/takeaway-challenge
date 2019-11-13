
require 'takeaway'
describe Takeaway do
  let(:takeaway_order) { Takeaway.new }
  it { expect(let.check).to respond_to(:order) }
     #takeaway_order = Takeaway.new

  it { expect(takeaway_order).to be_an_instance_of(Takeaway) }

  end
