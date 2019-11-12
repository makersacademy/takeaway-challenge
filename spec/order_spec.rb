require 'order'

describe Order do

  it 'can create a new instance of order' do
    expect(subject).to be_instance_of(Order)
  end

  it 'can add an item to an order list' do
    subject.add_item("test", 1)
    expect(subject.order_list).to eq [["test", 1]]
  end

end
