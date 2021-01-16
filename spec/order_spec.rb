require 'order'

describe Order do
  it 'initalizes with an empty order array' do
    expect(subject.order_list).to be_instance_of Array
    expect(subject.order_list).to be_empty
  end

  it 'adds a new item to the order list' do
    subject.add('item')
    expect(subject.order_list).to include('item')
  end
end
