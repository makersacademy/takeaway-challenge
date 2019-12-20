require 'takeaway'

describe Takeaway do
  it 'has an empty order' do
    expect(subject.order).to be_empty
  end

end
