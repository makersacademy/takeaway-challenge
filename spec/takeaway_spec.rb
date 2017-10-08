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

  #it 'should let customers to complete order' do
    #expect(takeaway.)
  #end
end

context 'view basket' do
before(:each)do
  takeaway.add('dumplings')
  takeaway.add('curry')
  takeaway.add('curry')
  takeaway.add('beer')
end

  it 'should show a list of orders with prices' do
    expect {takeaway.view_basket}.to output("{:dumplings_x_1=>\"£5\", :curry_x_2=>\"£10\", :beer_x_1=>\"£4\", :total=>\"£19\"}\n").to_stdout
    #expect(takeaway.view_basket).to eq({dumplings_x_1: '£5', curry_x_2: '£10', beer_x_1: '£4', total: '£19'})
  end

  it 'should let customers complete their order' do
    expect{takeaway.complete_order}.to output("Thanks. You should receive a text shortly to confirm delivery time.\n").to_stdout
  end
end

end
