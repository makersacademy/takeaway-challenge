require 'takeaway'

describe Takeaway do

  it 'starts with an empty list of orders' do
    expect(subject.order_list).to be_empty
  end

end
