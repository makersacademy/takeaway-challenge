require 'order'

describe Order do

  it 'a new order has nothing in it' do
    expect(subject.new_order).to be_empty
  end

end
