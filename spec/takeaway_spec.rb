require 'takeaway'

describe TakeAway do

  let(:takeaway) { TakeAway.new(kevin, order) }
  let(:kevin) {double :customer}
  let(:order) {double :order}

  it 'should take the customers name' do
    expect(takeaway.customer).to eq kevin
  end

  it 'should accept the customers order' do
    expect(takeaway.order).to eq order
  end

end