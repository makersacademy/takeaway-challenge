require './lib/order.rb'

describe Order do

  it 'responds to add_item with 2 arguments' do
    expect(subject).to respond_to(:add_item).with(2).arguments
  end

  it 'raises error if customer adds item not on menu' do
    expect{subject.add_item(:bread, 1)}.to raise_error 'Item not on menu'
  end

  it 'adds items to order_contents' do
    subject.add_item(:pepperoni_pizza, 1)
    expect(subject.contents).to include(:pepperoni_pizza, 1)
  end

  it 'returns "bill is correct" when total_price is correct' do
     subject.add_item(:pepperoni_pizza, 1)
     expect(subject.order_total(5.00)).to eq 'Bill is correct'
  end

  it 'raises an error when total_price is incorrect' do
    subject.add_item(:pepperoni_pizza, 1)
    expect{subject.order_total(4.00)}.to raise_error 'Incorrect bill'
  end
end
