require 'order'

describe Order do

  it 'initializes 0 total' do
    expect(subject.total).to eq(0)
  end

  it 'initializes an empty order list' do
    expect(subject.order_list).to be_empty
  end

end
