require 'order'

describe Order do

  item = 'burger'
  item2 = 'chips'

  it 'can add items to an order' do
    subject.add_item(item)
    expect(subject.items[0]).to include(item)
  end

  it 'can have more than one of each item' do
    2.times{subject.add_item(item)}
    expect(subject.order[0][:quantity]).to eq(2)
  end

  it 'can add different items' do
    subject.add_item(item)
    subject.add_item(item2)
    expect(subject.items[0]).to include(item)
    expect(subject.items[1]).to include(item2)
  end
  
end
