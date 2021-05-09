require 'order'

describe Order do
  it 'lets you select one dish' do
    subject.order_item('Fish')
    expect(subject.order_list).to include(Dish)
  end

  it 'lets you select multiple dishes' do
    subject.order_item('Fish')
    subject.order_item('Squirrel')
    expect(subject.order_list.length).to eq 2
  end

  it 'adds up the price of your order' do
    subject.order_item('Fish')
    subject.order_item('Curry')
    subject.order_item('Steak')
    expect(subject.total_price).to eq(28)
  end

  it 'can list the items in your basket' do
    subject.order_item('Fish')
    subject.order_item('Curry')
    subject.order_item('Steak')
    expect(subject.items_in_order).to eq('Fish, Curry, Steak')
  end
end