require 'order'

describe Order do
  it 'should exist' do
    expect(subject).to be_instance_of Order
  end
  it 'initializes with an instance variable order as an empty array' do
    expect(subject.order).to be_empty
  end
  it 'has a method add' do
    expect(subject).to respond_to(:add)
  end
  it 'has a method total' do
    expect(subject).to respond_to(:total)
  end
end
