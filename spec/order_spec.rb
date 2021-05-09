require 'order.rb'

describe Order do
  it 'can show you a list of dishes with prices' do
    expect(subject.display).to include ({dish: 'Fish', price: 9})
  end

  it 'lets you select one dish' do
    subject.order_item('Fish')
    expect(subject.order_list).to eq [{dish: "Fish", price: 9}]
  end

  it 'lets you select multiple dishes' do
    subject.order_item('Fish')
    subject.order_item('Squirrel')
    expect(subject.order_list).to eq [{dish: "Fish", price: 9}, {dish: 'Squirrel', price: 100}]
  end

  it 'adds up the price of your order' do
    subject.order_item('Fish')
    subject.order_item('Curry')
    subject.order_item('Steak')
    expect(subject.price).to eq(28)
  end

  it 'can list the items in your basket' do
    subject.order_item('Fish')
    subject.order_item('Curry')
    subject.order_item('Steak')
    expect(subject.items_in_order).to eq('Fish, Curry, Steak')
  end
end