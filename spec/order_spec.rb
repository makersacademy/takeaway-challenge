require 'order'

describe Order do
  it 'should update the cost' do
    subject.add(2)
    expect(subject.basket_cost).to eq "Total cost of items in basket:\n£7"
  end
  it 'should add the item to the basket' do
    subject.add(2)
    expect(subject.basket_items).to eq ["American Hot Pizza £7"]
  end
end
