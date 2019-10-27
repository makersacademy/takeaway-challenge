require 'order'

describe Order do
  let(:subject) { Order.new }

  it 'has a hash of items' do
    expect(subject.items).to be_a Hash
  end
 
end
