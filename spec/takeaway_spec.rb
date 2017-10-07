require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  it 'allows cusomters to add dishes' do
    expect(takeaway.add('item')).to eq(:item)
  end

context 'add multiple items' do
  before(:each)do
   takeaway.add('item')
   takeaway.add('item')
   takeaway.add('second_item')
  end

  it 'records the list of orders' do
    expect(takeaway.order[:item]).to eq(2)
    expect(takeaway.order[:second_item]).to eq(1)
  end
end

end
