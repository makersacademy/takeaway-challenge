require 'order'

describe Order do

let(:item) {"pork bao"}

  it 'starts with an empty order' do
    expect(subject.order_list).to be_empty
  end

  it 'adds an item to the order' do
    subject.add(item,5)
    expect(subject.order_list).to include(item)
  end

  it 'updates quantity of an item already in the order' do
    subject.add(item,5)
    subject.add(item,1)
    expect(subject.order_list[item]).to eq(6)
  end

end
