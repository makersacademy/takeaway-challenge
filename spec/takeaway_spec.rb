require 'takeaway'

describe Takeaway do

  let(:name) { double :name }

  it 'starts with an empty list of orders' do
    expect(subject.order_list).to be_empty
  end

  it 'customer can start order' do
    subject.start_order(name)
    expect(subject.order).to exist
  end

end
