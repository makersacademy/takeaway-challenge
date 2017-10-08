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

context 'view basket' do

  it 'should show a list of orders with prices' do
    takeaway.add('dumplings')
    takeaway.add('curry')
    takeaway.add('curry')
    takeaway.add('beer')
    expect(takeaway.view_basket).to eq({dumplings_x_1: '£5', curry_x_2: '£10', beer_x_1: '£4', total: '£19'})
  end
end

end
