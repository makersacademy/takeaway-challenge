require 'order'

describe Order do
  it 'should exist' do
    expect(subject).to be_instance_of Order
  end
  it 'initializes with an instance variable order as an empty array' do
    expect(subject.order).to be_empty
  end
end