require 'order'

describe Order do
  let(:order) { Order.new }
  it 'is an empty list by default' do
    expect(subject.order).to be_empty
  end

end
