require 'order'

describe Order do
  it 'initalizes with an empty order array' do
    expect(subject.order_list).to be_instance_of Array
    expect(subject.order_list).to be_empty
  end

  it 'adds a new item and quantity to the order list' do
    subject.add('item', 3)
    expect(subject.order_list).to include(['item', 3])
  end

  it 'raises an error if item is not on the menu' do

  end
end
