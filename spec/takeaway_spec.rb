require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new}

  it 'knows the completed customer order' do
    expect(takeaway.place_order(items)).to eq completed_order
  end

  xit ''
end
