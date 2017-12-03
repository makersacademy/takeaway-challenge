require 'takeaway'

describe Takeaway do
  it 'should create new order objects' do
    expect(subject.order_class).to respond_to(:new)
  end
end
