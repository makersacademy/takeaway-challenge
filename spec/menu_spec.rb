require 'menu'

describe Menu do
  it 'can show you a list of dishes with prices' do
    expect(subject.show).to include ({dish: 'Fish', price: 9})
  end

  it 'lets you select one dish' do
    subject.order('Fish')
    expect(subject.order_list).to eq [{dish: "Fish", price: 9}]
  end

  it 'lets you select multiple dishes' do
    subject.order('Fish')
    subject.order('Squirrel')
    expect(subject.order_list).to eq [{dish: "Fish", price: 9}, {dish: 'Squirrel', price: 100}]
  end

  it 'adds up the price of your order' do
    subject.order('Fish')
    subject.order('Curry')
    subject.order('Steak')
    expect(subject.price).to eq(28)
  end

  it 'can list the items in your basket' do
    subject.order('Fish')
    subject.order('Curry')
    subject.order('Steak')
    expect(subject.items_in_order).to eq('Fish, Curry, Steak')
  end
end